require 'rails_helper'

RSpec.describe PlexController, type: :controller do
  describe 'GET #index' do
    it 'redirects to the current Plex url' do
      get :index
      expect(response).to be_redirect
      expect(response).to have_http_status(307)
    end
  end

  describe 'PATCH #update' do
    it 'updates the IP address' do
      allow(Server).to receive(:filename).and_return 'ip.txt'
      patch :update, ip: 'new.ip.address', id: 1
      expect(response).to be_success
      expect(JSON.parse(response.body)['ip']).to eq('new.ip.address')
    end
  end
end
