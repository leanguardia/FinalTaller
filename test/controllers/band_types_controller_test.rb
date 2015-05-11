require 'test_helper'

class BandTypesControllerTest < ActionController::TestCase
  setup do
    @band_type = band_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:band_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create band_type" do
    assert_difference('BandType.count') do
      post :create, band_type: { model: @band_type.model }
    end

    assert_redirected_to band_type_path(assigns(:band_type))
  end

  test "should show band_type" do
    get :show, id: @band_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @band_type
    assert_response :success
  end

  test "should update band_type" do
    patch :update, id: @band_type, band_type: { model: @band_type.model }
    assert_redirected_to band_type_path(assigns(:band_type))
  end

  test "should destroy band_type" do
    assert_difference('BandType.count', -1) do
      delete :destroy, id: @band_type
    end

    assert_redirected_to band_types_path
  end
end
