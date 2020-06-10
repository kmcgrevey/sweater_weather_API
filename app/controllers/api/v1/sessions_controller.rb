class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: user_email)

    if (user != nil) && (user.password == user_password)
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: 200
    else
      render json: {error: "credentials are bad",
                    status: 401},
                    status: 401
    end
  end
  
  private

  def user_email
    params[:email]
  end
  
  def user_password
    params[:password]
  end
end