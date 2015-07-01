# talks to the Fitbit API and stores results in the database
# this service is used by the crono job
class FitbitService
  class << self
    def store!(date = 1.day.ago)
      f = Fitbit.new(date)
      record = Activity.new
      record.datestamp = datestamp(date)
      record.year = date.year
      record.month = date.month
      record.day = date.day
      record.number = Activity.count + 1
      record.steps = f.steps
      record.distance = f.distance
      record.calories = f.calories
      record.sedentary_minutes = f.sedentary_minutes
      record.active_minutes = f.active_minutes
      record.save

      true
    end

    private

    def datestamp(date)
      date.strftime("%Y%m%d")
    end
  end
end
