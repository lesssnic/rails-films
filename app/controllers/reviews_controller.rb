class ReviewsController < SecureController
  before_action :set_review, only: %i[show update destroy]
  before_action :find_film, only: %i[index create]

  def index
    @reviews = @film.reviews
  end

  def create
    @review = current_user.reviews.new(review_params)

    if @review.save
      render :show, status: :created
    else
      render json: @review.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
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
