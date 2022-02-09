class FilmsController < SecureController
  before_action :find_film, only: [:destroy]
  before_action :authorize_film!
  after_action :verify_authorized
  skip_before_action :authenticate_user!, only: :index

  def index
    @films = Film.includes(:reviews).pagination
  end

  def create
    @film = Film.new(film_params)
    render json: @film.errors, status: :unprocessable_entity unless @film.save
  end

  def destroy
    @film.destroy
  end

  private

  def find_film
    @film = Film.find_by(id: params[:id])
    head :not_found unless @film
  end

  def film_params
    params.require(:film).permit(:name, :description, :limit, :director_id)
  end

  def authorize_film!
    authorize(@film || Film)
  end
end
