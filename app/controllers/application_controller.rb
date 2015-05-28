class ApplicationController < ActionController::API
  respond_to :json

  include AbstractController::Translation

  before_action :authenticate_user_from_token!

  def authenticate_user_from_token!
    auth_token = request.headers[:authorization]

    if auth_token

    else

    end
  end

  private

  def authenticate_with_token(token)
    unless token.include?(':')
      authentication_error
      return
    end
    user_id = token.split(':').first
    user = User.find(user_id)

    if user && Devise.secure_compare(user.access_token, token)
      sign_in user, store: false
    else
      authentication_error
    end
  end

  def authentication_error
    render json: { error: t('errors.unauthorized') }, status: 401
  end
end
