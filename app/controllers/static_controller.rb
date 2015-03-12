class StaticController < ApplicationController
  def index
    render file: 'public/_index.html'
  end
end
