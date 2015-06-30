# fitbit.rb

class Fitbit
  attr_reader :date, :client

  def initialize(date = 1.day.ago)
    @date = date
    @client = Fitgem::Client.new(consumer_key: ENV['FITBIT_CONSUMER_KEY'], consumer_secret: ENV['FITBIT_CONSUMER_SECRET'], token: ENV['FITBIT_USER_TOKEN'], secret: ENV['FITBIT_USER_SECRET'])
  end

  def user_info
    client.user_info['user']
  end

  def activities_on_date
    client.activities_on_date(date)
  end

  def sleep_on_date
    client.sleep_on_date(date)
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
end
