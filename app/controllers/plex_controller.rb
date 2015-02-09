class PlexController < ApplicationController
  def main
    render :file => "public/_index.html"
  end

  def index
    redirect_to plex_url, :status => 307 # Temporary Redirect
  end

  def update
    render json: { ip: Plex.update_ip!(params[:ip]) }
  end

  private

  def plex_url
    "http://#{Plex.ip}:32400/web"
  end
end
