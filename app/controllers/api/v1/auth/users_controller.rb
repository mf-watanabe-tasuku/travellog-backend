class Api::V1::Auth::UsersController < ApplicationController
  def create
    @user = User.nnew(user_params)
    if @user.save
      render json: { status: :ok, data: @user }
    else
      render json: { status: 500, message: 'Something went wrong' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
