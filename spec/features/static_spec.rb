require 'rails_helper'

RSpec.describe StaticController, type: :feature do
  describe 'Unknown pages' do
    it 'should redirect to homepage if not found' do
      visit '/notfound'
      expect(page).to have_http_status(200)
      expect(page).to have_title '[zen punch]'
    end
  end
end
