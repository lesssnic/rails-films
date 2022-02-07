class ActorsController < SecureController
  before_action :set_actor, only: %i[show update destroy]

  # GET /actors
  # GET /actors.json
  def index
    @actors = Actor.all
  end

  def create
    @actor = Actor.new(actor_params)
    render json: @actor.errors, status: :unprocessable_entity unless @actor.save
  end

  def update
    render json: @actor.errors, status: :unprocessable_entity unless @actor.update(actor_params)
  end

  def destroy
    @actor.destroy
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.fetch(:actor, {})
  end
end
