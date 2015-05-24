require 'test_helper'

class BandDataControllerTest < ActionController::TestCase
  setup do
    @band_datum = band_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:band_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band_datum" do
    assert_difference('BandDatum.count') do
      post :create, band_datum: { band_id: @band_datum.band_id, calories_burnt: @band_datum.calories_burnt, hearth_rate_pminute: @band_datum.hearth_rate_pminute, latitude: @band_datum.latitude, longitude: @band_datum.longitude, steps_taken: @band_datum.steps_taken, user_id: @band_datum.user_id }
    end

    assert_redirected_to band_datum_path(assigns(:band_datum))
  end

  test "should show band_datum" do
    get :show, id: @band_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @band_datum
    assert_response :success
  end

  test "should update band_datum" do
    patch :update, id: @band_datum, band_datum: { band_id: @band_datum.band_id, calories_burnt: @band_datum.calories_burnt, hearth_rate_pminute: @band_datum.hearth_rate_pminute, latitude: @band_datum.latitude, longitude: @band_datum.longitude, steps_taken: @band_datum.steps_taken, user_id: @band_datum.user_id }
    assert_redirected_to band_datum_path(assigns(:band_datum))
  end

  test "should destroy band_datum" do
    assert_difference('BandDatum.count', -1) do
      delete :destroy, id: @band_datum
    end

    assert_redirected_to band_data_path
  end
end
