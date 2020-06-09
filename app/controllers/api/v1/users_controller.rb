class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(user_params)
    user.generate_key
    # render json: UserSerializer.new(User.create(params))
    binding.pry

  end

  private

  def user_params
    params.permit(:email, :password, :api_key)
  end
end