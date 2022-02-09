class UsersController < ApplicationController
  before_action :find_user, only: [:update, :destroy]
  before_action :authorize_user!
  after_action :verify_authorized

  def index
    @users = User.all
  end

  def create
  end

  def update
    render json: @user.errors, status: :unprocessable_entity unless @user.update(user_params)
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
    head :not_found unless @user
  end

  def user_params
    params.require(:user).permit(:role, :name, :nickname)
  end

  def authorize_user!
    authorize(@user || User)
  end
end
