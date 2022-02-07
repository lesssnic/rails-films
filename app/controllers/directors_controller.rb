class DirectorsController < SecureController
  before_action
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

  def director_params
    params.require(:director).permit(:first_name, :last_name, :photo)
  end
end
