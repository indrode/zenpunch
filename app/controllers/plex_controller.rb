class PlexController < ApplicationController
  def index
    redirect_to plex_url, :status => 307 # Temporary Redirect
  end

  def update
    ip = params[:ip]
    Plex.update_ip!(ip)
    render json: { ip: ip }
  end

  private

  def plex_url
    "http://#{Plex.ip}:32400/web"
  end
end
