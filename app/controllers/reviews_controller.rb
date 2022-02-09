class ReviewsController < SecureController
  before_action :find_film, only: %i[index create update]
  before_action :set_review, only: %i[update destroy]
  before_action :authorize_review!
  after_action :verify_authorized
  skip_before_action :authenticate_user!, only: :index

  def index
    @reviews = @film.reviews.infinity_scroll
  end

  def create
    @review = current_user.reviews.new(review_params)
    render json: @review.errors, status: :unprocessable_entity unless @review.save
  end

  def update
    return render json: "Not Found", status: :not_found if @review.nil?
    render json: @review.errors, status: :unprocessable_entity unless @review.update({description: params[:description], rating: params[:rating]})
  end

  def destroy
    return render json: "Not Found", status: :not_found if @review.nil?
    @review.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = @film.reviews.find_by(id: params[:id])
    head :not_found unless @review
  end

  def find_film
    @film = Film.find_by(id: params[:film_id])
    head :not_found unless @film
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.permit(:description, :rating, :film_id)
  end

  def authorize_review!
    authorize(@review || Review)
  end
end
