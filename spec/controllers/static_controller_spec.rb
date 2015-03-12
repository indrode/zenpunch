require 'rails_helper'

RSpec.describe StaticController, type: :controller do
  describe 'GET #index' do
    it 'displays the homepage' do
      get :index
      expect(response).to have_http_status(200)
      expect(response.body).to include('[zen punch]')
    end
  end
end
