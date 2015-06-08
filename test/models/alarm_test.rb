require 'test_helper'

class AlarmTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should get days array' do
    days = Array.new
    days << ['All days', 0]
    days << ['Monday', 1]
    days << ['Tuesday', 2]
    days << ['Wednesday', 3]
    days << ['Thursday', 4]
    days << ['Friday', 5]
    days << ['Saturday', 6]
    days << ['Sunday', 7]
    assert_equal(days, Alarm.get_days)
  end

  test 'should create alarms' do
    count = Alarm.count
    Alarm.create({user_id: 1, day_week: '0', alarm_hour: Time.now, state: true});
    Alarm.create({user_id: 1, day_week: '1', alarm_hour: Time.now, state: true});
    Alarm.create({user_id: 1, day_week: '2', alarm_hour: Time.now, state: true});
    Alarm.create({user_id: 1, day_week: '3', alarm_hour: Time.now, state: true});
    Alarm.create({user_id: 1, day_week: '4', alarm_hour: Time.now, state: true});
    Alarm.create({user_id: 1, day_week: '5', alarm_hour: Time.now, state: true});
    Alarm.create({user_id: 1, day_week: '6', alarm_hour: Time.now, state: true});
    Alarm.create({user_id: 1, day_week: '7', alarm_hour: Time.now, state: true});
    assert_equal(count+8, Alarm.count)
  end

end
