class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: {error: "credentials are bad",
                    status: 401},
                    status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :api_key)
  end
end