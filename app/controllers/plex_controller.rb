class PlexController < ApplicationController
  def index
    redirect_to plex_url, status: 307 # Temporary Redirect
  end

  def update
    render json: { ip: Server.update_ip!(params[:ip]) }
  end

  private

  def plex_url
    "http://#{Server.ip}:32400/web"
  end
end
