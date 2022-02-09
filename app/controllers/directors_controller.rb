class DirectorsController < SecureController
  before_action :authorize_director!
  after_action :verify_authorized
  skip_before_action :authenticate_user!, only: :index
  def index
    @directors = Director.all
  end

  def create
    @director = Director.new(director_params)
    render json: @director.errors, status: :unprocessable_entity unless @director.save
  end

  def destroy
    @director = Director.find_by id: params[:id]
    render json.director destroyed: false unless @director.destroy
  end

  private

  def director_params
    params.require(:director).permit(:first_name, :last_name, :photo)
  end

  def authorize_director!
    authorize(@director || Director)
  end
end
