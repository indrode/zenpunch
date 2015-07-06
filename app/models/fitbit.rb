# fitbit.rb

class Fitbit
  attr_reader :date, :client

  def initialize(date = 1.day.ago)
    @date = date
    @client = Fitgem::Client.new(consumer_key: ENV['FITBIT_CONSUMER_KEY'], consumer_secret: ENV['FITBIT_CONSUMER_SECRET'], token: ENV['FITBIT_USER_TOKEN'], secret: ENV['FITBIT_USER_SECRET'])
  end

  def user_info
    @user_info ||= client.user_info['user']
  end

  def activities_on_date
    @activities_on_date ||= client.activities_on_date(date)
  end

  def steps
    activities_on_date['summary']['steps']
  end

  def distance
    activities_on_date['summary']['distances'].first['distance']
  end

  def calories
    activities_on_date['summary']['caloriesOut']
  end

  def sedentary_minutes
    activities_on_date['summary']['sedentaryMinutes']
  end

  def active_minutes
    activities_on_date['summary']['veryActiveMinutes']
  end

  def sleep_on_date
    # TODO: do not use .first, but check for isMainSleep == true
    @sleep_on_date ||= client.sleep_on_date(date)['sleep'].first
  end

  def asleep
    sleep_on_date['minutesAsleep']
  end

  def awake
    sleep_on_date['minutesAwake']
  end

  def fallen_asleep
    sleep_on_date['minutesToFallAsleep']
  end

  def restless
    sleep_on_date['restlessDuration']
  end

  def restless_count
    sleep_on_date['restlessCount']
  end

  def efficiency
    sleep_on_date['efficiency']
  end

  def start_time
  end

  def end_time
  end
end
