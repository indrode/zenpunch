require 'rails_helper'

RSpec.describe Server, type: :model do
  describe '.ip' do
    it 'retrieves the currently stored IP address' do
      expect(File).to receive(:read).with("#{Rails.root}/../../shared/ip.txt").and_return 'an.ip.address'
      expect(Server.ip).to eq('an.ip.address')
    end
  end

  describe '.update_ip!' do
    it 'stores an IP address' do
      allow(File).to receive(:write).with("#{Rails.root}/../../shared/ip.txt", 'new.ip.address')
      expect(Server.update_ip!('new.ip.address')).to eq('new.ip.address')
    end
  end
end
