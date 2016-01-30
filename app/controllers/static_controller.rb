class StaticController < ApplicationController
  def index
    render json: '[zen punch] API'.to_json
  end
end
