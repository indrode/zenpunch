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

# TODO: test responses with multiple sleep records
def sleeps
  {
    "sleep" => [
      {
        "awakeCount" => 0,
        "awakeDuration" => 5,
        "awakeningsCount" => 11,
        "dateOfSleep" => "2015-07-02",
        "duration" => 20580000,
        "efficiency" => 94,
        "isMainSleep" => true,
        "logId" => 1081932464,
        "minuteData" => [
          {
            "dateTime" => "04:25:00",
            "value" => "2"
          },
          {
            "dateTime" => "04:26:00",
            "value" => "3"
          }
        ],
        "minutesAfterWakeup" => 0,
        "minutesAsleep" => 309,
        "minutesAwake" => 21,
        "minutesToFallAsleep" => 13,
        "restlessCount" => 11,
        "restlessDuration" => 29,
        "startTime" => "2015-07-02T04:25:00.000",
        "timeInBed" => 343
      }
    ],
    "summary" => {
      "totalMinutesAsleep" => 309,
      "totalSleepRecords" => 1,
      "totalTimeInBed" => 343
    }
  }
end

RSpec.describe Fitbit, type: :model do
  let!(:f) { Fitbit.new }

  before do
    allow(f.client).to receive(:user_info).and_return('user' => 'user_info')
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

  describe 'sleeps' do
    before do
      allow(f.client).to receive(:sleep_on_date).and_return(sleeps)
    end

    describe '#sleep_on_date' do
      it 'returns the sleep_on_date hash' do
        skip 'todo'
        allow(f.client).to receive(:sleep_on_date).and_return(['sleeps'])
        expect(f.sleep_on_date).to eq('sleeps')
      end
    end

    describe '#asleep' do
      it 'returns the correct number of minutes asleep' do
        expect(f.asleep).to eq(309)
      end
    end

    describe '#awake' do
      it 'returns the correct number of minutes awake' do
        expect(f.awake).to eq(21)
      end
    end

    describe '#fallen_asleep' do
      it 'returns the correct number of minutes it took to fall asleep' do
        expect(f.fallen_asleep).to eq(13)
      end
    end

    describe '#restless' do
      it 'returns the correct number of restless minutes' do
        expect(f.restless).to eq(29)
      end
    end

    describe '#restless_count' do
      it 'returns the correct number of restless counts' do
        expect(f.restless_count).to eq(11)
      end
    end

    describe '#efficiency' do
      it 'returns the correct efficiency rating' do
        expect(f.efficiency).to eq(94)
      end
    end

    describe '#start_time' do
      it 'returns the correct start_time' do
        skip 'todo'
        expect(f.start_time).to eq(:someting)
      end
    end

    describe '#end_time' do
      it 'returns the correct end_time' do
        skip 'todo'
        expect(f.end_time).to eq(:something)
      end
    end
  end
end
