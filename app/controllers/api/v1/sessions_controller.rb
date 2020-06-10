class Api::V1::SessionsController < ApplicationController

   def create
    user = User.find_by(email: params[:email])
    # binding.pry
    
    # if user.authenticate(params[:password])
    if user.password == params[:password]
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: 200

    #   flash[:success] = "You are logged in!"
    #   if user.default?
    #     redirect_to "/profile"
    #   elsif user.merchant?
    #     redirect_to "/merchant"
    #   elsif user.admin?
    #     redirect_to "/admin"
    #   end
    else
      render status: 201#, "credentials are bad" 
    #   flash[:error] = "The credentials you entered are incorrect"
    #   redirect_to "/login"
    end

    # private

    # def login_params
    #   params.permit(:email)
  end

end