require 'rails_helper'

RSpec.describe ZeroController, type: :controller do
  describe 'GET #index' do
    it 'returns an IP address' do
      allow(Server).to receive(:ip).and_return 'some.ip.address'
      get :index
      expect(response).to be_success
      expect(JSON.parse(response.body)['ip']).to eq('some.ip.address')
    end
  end
end
