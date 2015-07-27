class ApplicationController < ActionController::API
  protect_from_forgery

  def routing_error
    redirect_to controller: :static, action: :index, status: 302
  end
end
