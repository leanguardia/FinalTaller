class Workout < ActiveRecord::Base
  belongs_to :workout_type
  belongs_to :user
  has_many :band_datums


  def self.get_types
    types = Array.new()
    WorkoutType.all.each do |x|
      types << [x.typename, x.id]
  	end
  	types
  end

  def calculate_data
    calories=0
    steps=0
    heartrate=0

    self.band_datums.each do |datum|
      calories+=datum.calories_burnt
      steps+=datum.steps_taken
      heartrate+=datum.heart_rate_pminute
    end

    if self.band_datums.count>0
      heartrate/=self.band_datums.count
    end

    self.update(calories: calories, steps: steps, heartrate: heartrate)
  end

end
