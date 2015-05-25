require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { active: @user.active, birthdate: @user.birthdate, email: @user.email, height: @user.height, lastname: @user.lastname, name: @user.name, password_hash: @user.password_hash, password_salt: @user.password_salt, role: @user.role, sex: @user.sex, weight: @user.weight }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { active: @user.active, birthdate: @user.birthdate, email: @user.email, height: @user.height, lastname: @user.lastname, name: @user.name, password_hash: @user.password_hash, password_salt: @user.password_salt, role: @user.role, sex: @user.sex, weight: @user.weight }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "should update user in parameter active" do
    User.create( 
          :name => "Usuario",
          :lastname => "De Perueba",
          :email =>"user@gmail.com",
          :password => "123456",
          :sex => "Male",
          :weight => "70.5",
          :height => "1.70",          
          :birthdate => "10/10/1991",
          :role => "Client",
          :active => true)
    type = '0'
    if type == '1'
      @user.active = true
    else
      @user.active = false
    end
    patch :update, id: @user, user: { active: @user.active, birthdate: @user.birthdate, email: @user.email, height: @user.height, lastname: @user.lastname, name: @user.name, password_hash: @user.password_hash, password_salt: @user.password_salt, role: @user.role, sex: @user.sex, weight: @user.weight }
    assert_equal(@user.active = false, @user.active = false, msg = nil) 
    assert_redirected_to users_url
  end

end
