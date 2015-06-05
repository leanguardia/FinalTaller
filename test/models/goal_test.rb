require 'test_helper'

class GoalTest < ActiveSupport::TestCase

  setup do
    @goal = goals(:one)
  end

  test 'should get times option array' do
    times = Array.new
    times << ['1 day', 1]
    times << ['1 week', 2]
    times << ['1 month', 3]
    times << ['3 months', 4]
    times << ['6 months', 5]
    times << ['1 year', 6]
    assert_equal(times, Goal.get_times)
  end

  test 'should create six goals' do
    assert_equal(6, Goal.all.count)
  end

  test 'should get all goal types in an array' do
    assert_equal(6, Goal.get_types.count)
  end
end
