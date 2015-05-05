require 'test_helper'

class GoalRangesControllerTest < ActionController::TestCase
  setup do
    @goal_range = goal_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:goal_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create goal_range" do
    assert_difference('GoalRange.count') do
      post :create, goal_range: { end_time: @goal_range.end_time, goal_id: @goal_range.goal_id, start_time: @goal_range.start_time }
    end

    assert_redirected_to goal_range_path(assigns(:goal_range))
  end

  test "should show goal_range" do
    get :show, id: @goal_range
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @goal_range
    assert_response :success
  end

  test "should update goal_range" do
    patch :update, id: @goal_range, goal_range: { end_time: @goal_range.end_time, goal_id: @goal_range.goal_id, start_time: @goal_range.start_time }
    assert_redirected_to goal_range_path(assigns(:goal_range))
  end

  test "should destroy goal_range" do
    assert_difference('GoalRange.count', -1) do
      delete :destroy, id: @goal_range
    end

    assert_redirected_to goal_ranges_path
  end
end
