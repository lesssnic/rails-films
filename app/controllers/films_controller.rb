class FilmsController < ApplicationController
  def index
    @films = Film.includes(:reviews).all
    # @film.ratings = @film.reviews.reduce(0) { |sum, i| (i.rating + sum) } / @film.reviews.length
    # render json: @film.to_json(include: :reviews)
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      render json: @film
    else
      render json: @film.errors
    end
  end

  def film_params
    params.require(:film).permit(:name, :description, :limit, :director_id)
  end
end
