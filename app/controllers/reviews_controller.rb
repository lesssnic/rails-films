class ReviewsController < SecureController
  before_action :set_review, only: %i[update destroy]
  before_action :find_film, only: %i[index create]

  def index
    @reviews = @film.reviews.pagination(1, 5, "created_at")
  end

  def create
    @review = current_user.reviews.new(review_params)
    render json: @review.errors, status: :unprocessable_entity unless @review.save
  end

  def destroy
    return render json: "Not Found", status: :not_found if @review.nil?
    @review.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = current_user.reviews.find_by(id: params[:id])
  end

  def find_film
    @film = Film.find_by(id: params[:film_id])
    head :not_found unless @film
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.permit(:description, :rating, :film_id)
  end
end
