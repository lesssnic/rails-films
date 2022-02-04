class ActorsController < ApplicationController
  before_action :set_actor, only: %i[show update destroy]

  # GET /actors
  # GET /actors.json
  def index
    @actors = Actor.all
  end

  # GET /actors/1
  # GET /actors/1.json
  def show
  end

  # POST /actors
  # POST /actors.json
  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      render :show, status: :created, location: @actor
    else
      render json: @actor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /actors/1
  # PATCH/PUT /actors/1.json
  def update
    if @actor.update(actor_params)
      render :show, status: :ok, location: @actor
    else
      render json: @actor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /actors/1
  # DELETE /actors/1.json
  def destroy
    @actor.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_actor
    @actor = Actor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def actor_params
    params.fetch(:actor, {})
  end
end
