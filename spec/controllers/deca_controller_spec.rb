require 'rails_helper'

RSpec.describe DecaController, type: :controller do
  describe 'POST #create' do
    it 'redirects after sending email' do
      post :create, contact: { name: 'test', phone: '555-555-5555' }
      expect(response).to be_redirect
    end

    it 'fails if validation failed' do
      post :create, contact: { name: 'test', phone: '123456' }
      expect(response.body).to eq('Invalid data!')
    end

    it 'fails if spam check activated' do
      post :create, contact: { name: 'test', alternative: 'my@mail.com' }
      expect(response.body).to eq('Invalid data!')
    end
  end
end
