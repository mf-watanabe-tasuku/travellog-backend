class Api::V1::Auth::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      render json: { status: :created, data: user }
    else
      render json: { status: :unauthorized, message: 'email or password invalid' }
    end
  end
end
