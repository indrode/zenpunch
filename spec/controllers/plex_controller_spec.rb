require 'rails_helper'

RSpec.describe PlexController, type: :controller do
  describe 'GET #index' do
    it "redirects to the current Plex url" do
      allow_any_instance_of(PlexController).to receive(:plex_url).and_return 'test.url'
      get :index
      expect(response).to be_redirect
      expect(response).to have_http_status(307)
    end
  end

  describe 'PATCH #update' do
    it "updates the IP address" do
      patch :update, ip: 'new.ip.address', id: 1
      expect(response).to be_success
      expect(JSON.parse(response.body)['success']).to be > 0
    end
  end
end
