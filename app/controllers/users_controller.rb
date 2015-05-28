class UsersController < ApplicationController
  skip_before_action :authenticate_user_from_token!, only: :create
  before_action :set_user, only: [:show, :update, :destroy]

  def show
  end

  def create
    @user = User.new user_params
    if @user.save
      render json: @user, serializer: SessionSerializer, root: nil
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :login, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

