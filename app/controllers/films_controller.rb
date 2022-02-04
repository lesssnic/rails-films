class FilmsController < ApplicationController
  def index
    @films = Film.includes(:reviews).order(:id).page(1).per(10)
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
