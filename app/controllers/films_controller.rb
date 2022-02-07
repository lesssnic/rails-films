class FilmsController < SecureController
  def index
    @films = Film.includes(:reviews).pagination
  end

  def create
    @film = Film.new(film_params)
    render json: @film.errors, status: :unprocessable_entity unless @film.save
  end

  def film_params
    params.require(:film).permit(:name, :description, :limit, :director_id)
  end
end
