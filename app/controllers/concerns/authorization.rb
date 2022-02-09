module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized(error)
      render json: {error: error}, status: :forbidden
    end
  end
end
