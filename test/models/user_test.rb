require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "given a user named user@gmail.com with a password of 123456, he should be authenticated with 'user@gmail.com' and '123456' " do
    User.create( 
    			:name => "Usuario",
    			:lastname => "De Perueba",
    			:email =>"user@gmail.com",
                :password => "123456",
    			:sex => "MAle",
    			:weight => "70.5",
    			:height => "1.70",          
    			:birthdate => "10/10/1991"
                :role => "Client",
                :active => true)
    assert User.authenticated?("homer", "123456")   
  end
  # test "the truth" do
  #   assert true
  # end
end
