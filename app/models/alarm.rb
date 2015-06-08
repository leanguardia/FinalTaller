class Alarm < ActiveRecord::Base
  
  belongs_to :user

  before_create :set_values
  before_update :set_values

  def self.get_days
    days = Array.new
    days << ['All days', 0]
    days << ['Monday', 1]
    days << ['Tuesday', 2]
    days << ['Wednesday', 3]
    days << ['Thursday', 4]
    days << ['Friday', 5]
    days << ['Saturday', 6]
    days << ['Sunday', 7]
    days
  end

  def set_values   
    case self.day_week
      when '0'
        self.day_week = 'All days'
      when '1'
        self.day_week = 'Monday'
      when '2'
        self.day_week = 'Tuesday'
      when '3'
        self.day_week = 'Wednesday'
      when '4'
        self.day_week = 'Thursday'
      when '5'
        self.day_week = 'Friday'
      when '6'
        self.day_week = 'Saturday'
      when '7'
        self.day_week = 'Sunday'
    end
  end

  def verify_day_and_hour_of_alarm(alarm)
    timeNow = DateTime.now    
    dayNow = timeNow.strftime("%A")
    hourNow = timeNow.strftime("%H")
    minuteNow = timeNow.strftime("%M")

    day = alarm.day_week.strftime("%A")
    hour = alarm.day_week.strftime("%H")
    minute = alarm.day_week.strftime("%M")

    if day == 'All days' && alarm.state == true && hour == hourNow && minute == minuteNow      
      return true
    elsif day == dayNow && alarm.state == true && hour == hourNow && minute == minuteNow
      return true
    else
      return false
    end
  end

end
