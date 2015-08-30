require 'rails_helper'

RSpec.describe DecaController, type: :controller do
  describe 'POST #create' do
    it 'redirects after sending email' do
      post :create, contact: { name: 'test', phone: '555-555-5555' }
      expect(response).to be_redirect
    end
  end
end
