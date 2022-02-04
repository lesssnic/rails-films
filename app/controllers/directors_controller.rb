class DirectorsController < ApplicationController
  before_action
  def index
    @director = Director.all
    render json: @director
  end

  def create
    @director = Director.new(director_params)
    if @director.save
      render json: @director
    else
      render json: "Something went wrong"
    end
  end

  def destroy
    @director = Director.find_by id: params[:id]
    if @director.destroy
      render json: "Destroyed"
    else
      render json: "Something went wrong"
    end
  end

  def director_params
    params.require(:director).permit(:first_name, :last_name, :photo)
  end
end
