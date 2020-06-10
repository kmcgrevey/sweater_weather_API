class Api::V1::SessionsController < ApplicationController

   def create
    user = User.find_by(email: params[:email])

    if (user != nil) && (user.password == params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: 200
    else
      render json: {error: "credentials are bad",
                    status: 401},
                    status: 401
    end

    # private

    # def login_params
    #   params.permit(:email)
    # end
  end
end