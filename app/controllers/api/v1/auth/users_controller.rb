class Api::V1::Auth::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: { status: :created, data: user }
    else
      render json: { status: :internal_server_error, message: 'Something went wrong' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
