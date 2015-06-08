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

  test 'should return result array' do
    goals = Goal.generate_history(1, User.find(1).goals.first)
    assert_kind_of(Array, goals)
    goals = Goal.generate_history(1, User.find(1).goals[1])
    assert_kind_of(Array, goals)
  end

  test 'should calculate measurements' do
    Goal.calculate_measure(1, Goal.where(user_id: 1).first)
    Goal.calculate_measure(1, Goal.where(user_id: 1)[1])
  end

  test 'should create different intervals' do
    Goal.create({interval: 2, goal_type_id: 1, user_id: 1, target: 3000, reached: 1000, created_at: Time.now, start_date: Time.now, updated_at: Time.now})
    Goal.create({interval: 3, goal_type_id: 2, user_id: 1, target: 3000, reached: 1000, created_at: Time.now, start_date: Time.now, updated_at: Time.now})
    Goal.create({interval: 4, goal_type_id: 1, user_id: 1, target: 3000, reached: 1000, created_at: Time.now, start_date: Time.now, updated_at: Time.now})
    Goal.create({interval: 5, goal_type_id: 2, user_id: 1, target: 3000, reached: 1000, created_at: Time.now, start_date: Time.now, updated_at: Time.now})
    Goal.create({interval: 6, goal_type_id: 1, user_id: 1, target: 3000, reached: 1000, created_at: Time.now, start_date: Time.now, updated_at: Time.now})
  end

  test 'should create six goals' do
    assert_equal(6, Goal.all.count)
  end

  test 'should get all goal types in an array' do
    assert_equal(6, Goal.get_types.count)
  end
end
