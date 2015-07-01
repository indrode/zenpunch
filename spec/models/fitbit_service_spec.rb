require 'rails_helper'

RSpec.describe FitbitService, type: :model do
  let(:fs) { FitbitService }
  let(:fitbit_data) {
    double(:fitbit_data, steps: 500, distance: 1.25, calories: 1500, sedentary_minutes: 10, active_minutes: 5)
  }

  describe '.store!' do
    it 'should call the Fitbit class' do
      expect(Fitbit).to receive(:new).and_return fitbit_data
      fs.store!
    end
  end
end
