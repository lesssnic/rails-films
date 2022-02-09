class BlockedController < SecureController
  before_action :find_user, only: [:update]
  before_action :authorize_user!
  after_action :verify_authorized

  def update
    render json: @user.errors, status: :unprocessable_entity unless @user.update(user_params)
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
    head :not_found unless @user
  end

  def authorize_user!
    authorize(@user || User)
  end

  def user_params
    params[:unblocked] == true ? {blocked_at: nil} : {blocked_at: Time.now}
  end
end
