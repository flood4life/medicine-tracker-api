class SessionController < ApplicationController
  skip_before_action :authenticate_user_from_token!

  def create
    login_params; return if performed?
    @user = User.find_for_database_authentication(email: login_params[:email])
    if @user.nil?
      invalid_login
      return
    end
    if @user.valid_password?(login_params[:password])
      sign_in :user, @user
      render json: @user, serializer: SessionSerializer, root: nil
    else
      invalid_login
    end
  end

  private

  def invalid_login
    warden.custom_failure!
    render json: { error: t('errors.invalid_login') }, status: :unprocessable_entity
  end

  def login_params
    params.require(:session).permit(:email, :password)
  rescue
    invalid_login
  end
end

