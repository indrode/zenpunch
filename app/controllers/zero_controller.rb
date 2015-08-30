class ZeroController < ApplicationController
  def index
    render json: { ip: Server.ip }
  end
end
