require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
  
  test "should get all workout types in an array" do
    type = Array.new
    WorkoutType.all.each do |x|
      type << [x.typename, x.id]
    end
    assert_equal(type, Workout.get_types)
  end
end
