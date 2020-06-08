class Api::V1::BackgroundController < ApplicationController

  def show
    background = Background.new(params[:location])
    render json: BackgroundSerializer.new(background)
  end

end