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

end
