
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "given a user named user@gmail.com with a password of 123456, he should be authenticated with 'user@gmail.com' and '123456' " do
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

    assert User.authenticate("user@gmail.com", "123456")
  end

  test 'should create 16 automatic goals when 4 new users are created' do
    count = Goal.all.count
    User.create(
        :name => 'Test',
        :lastname => 'User',
        :email =>'test@gmail.com',
        :password => '123456',
        :sex => 'Male',
        :weight => '70.5',
        :height => '1.70',
        :birthdate => '10/10/1991',
        :role => 'Client',
        :active => true)

    User.create(
        :name => 'Test',
        :lastname => 'User',
        :email =>'test@gmail.com',
        :password => '123456',
        :sex => 'Female',
        :weight => '70.5',
        :height => '1.70',
        :birthdate => '10/10/1800',
        :role => 'Client',
        :active => true)

    User.create(
        :name => 'Test',
        :lastname => 'User',
        :email =>'test@gmail.com',
        :password => '123456',
        :sex => 'Male',
        :weight => '7.5',
        :height => '1.70',
        :birthdate => '10/10/1980',
        :role => 'Client',
        :active => true)

    User.create(
        :name => 'Test',
        :lastname => 'User',
        :email =>'test@gmail.com',
        :password => '123456',
        :sex => 'Male',
        :weight => '7.5',
        :height => '1.70',
        :birthdate => '10/10/2009',
        :role => 'Client',
        :active => true)

    User.find(1).verify_day_and_hour_of_alarm(Alarm.new(id: 999, alarm_hour: Time.now, day_week:'2', state: true))

    assert_equal((count+16), Goal.all.count, '4 goals created')
  end

  test 'should get day of the week' do
    (0..6).each do |num|
      User.all.first.convert_values_of_days(num)
    end
  end

  test "should return a target_value for quality sleep" do
   
    assert User.authenticate("user@gmail.com", "123456")
  end

end
