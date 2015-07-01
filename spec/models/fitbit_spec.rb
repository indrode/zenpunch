require 'rails_helper'

def activities
  {
    "activities" => [],
    "goals" => {
      "activeMinutes" => 30,
      "caloriesOut" => 2700,
      "distance" => 4.97,
      "steps" => 10000
    },
    "summary" => {
      "activeScore" => -1,
      "activityCalories" => 1540,
      "caloriesBMR" => 1721,
      "caloriesOut" => 2955,
      "distances" => [
        {
          "activity" => "total",
          "distance" => 6.94
        },
        {
          "activity" => "tracker",
          "distance" => 6.94
        },
        {
          "activity" => "loggedActivities",
          "distance" => 0
        },
        { "activity" => "veryActive",
          "distance" => 2.13
        },
        { "activity" => "moderatelyActive",
          "distance" => 1.55
        },
        {
          "activity" => "lightlyActive",
          "distance" => 3.26
        },
        {
          "activity" => "sedentaryActive",
          "distance" => 0
        }
      ],
      "fairlyActiveMinutes" => 52,
      "lightlyActiveMinutes" => 233,
      "marginalCalories" => 903,
      "sedentaryMinutes" => 848,
      "steps" => 14581,
      "veryActiveMinutes" => 33
    }
  }
end

RSpec.describe Fitbit, type: :model do
  let!(:f) { Fitbit.new }

  before do
    allow(f.client).to receive(:user_info).and_return('user' => 'user_info')
    allow(f.client).to receive(:sleep_on_date).and_return('sleep' => ['isMainSleep' => true])
  end

  describe '#initialize' do
    it 'should initialize with default date' do
      expect(f).to be_truthy
      expect(f.date.year).to eq(1.day.ago.year)
      expect(f.date.month).to eq(1.day.ago.month)
      expect(f.date.day).to eq(1.day.ago.day)
    end

    it 'should set custom date' do
      expect(Fitbit.new(2.days.ago).date.day).to eq(2.days.ago.day)
    end
  end

  describe '#user_info' do
    it 'returns the user_info hash' do
      expect(f.user_info).to eq('user_info')
    end
  end

  describe '#activities_on_date' do
    it 'returns the activities hash' do
      allow(f.client).to receive(:activities_on_date).and_return('activities')
      expect(f.activities_on_date).to eq('activities')
    end
  end

  describe '#sleep_on_date' do
    it 'returns the sleep_on_date hash' do
      expect(f.sleep_on_date).to eq('sleep' => ['isMainSleep' => true])
    end
  end

  describe 'activities' do
    before do
      allow(f).to receive(:activities_on_date).and_return(activities)
    end

    describe '#steps' do
      it 'returns the correct number of steps' do
        expect(f.steps).to eq(14581)
      end
    end

    describe '#distance' do
      it 'returns the correct distance' do
        expect(f.distance).to eq(6.94)
      end
    end

    describe '#calories' do
      it 'returns the correct number of calories' do
        expect(f.calories).to eq(2955)
      end
    end

    describe '#sedentary_minutes' do
      it 'returns the correct number of sedentary minutes' do
        expect(f.sedentary_minutes).to eq(848)
      end
    end

    describe '#active_minutes' do
      it 'returns the correct number of active minutes' do
        expect(f.active_minutes).to eq(33)
      end
    end
  end
end
