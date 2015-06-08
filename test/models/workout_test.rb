require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase

  setup do
    @workout = workouts(:one)
  end

  test 'should get all workout types in an array' do
    type = Array.new
    WorkoutType.all.each do |x|
      type << [x.typename, x.id]
    end
    assert_equal(type, Workout.get_types)
  end

  test 'should calculate data from band_datum' do
    test = Workout.new(id: 1,user_id: 1,start: '2015-05-21 17:05:00',end: '2015-05-21 19:05:00' ,name: "testing")
    test.save!
    calories=0
    steps=0
    heartrate=0

    test.band_datums.each do |datum|
      calories+=datum.calories_burnt
      steps+=datum.steps_taken
      heartrate+=datum.heart_rate_pminute
    end

    heartrate/=@workout.band_datums.count if @workout.band_datums.count>0

    assert_equal(calories,@workout.calories)
    assert_equal(steps,@workout.steps)
    assert_equal(heartrate,@workout.heartrate)
    @workout.calculate_data
  end

end
