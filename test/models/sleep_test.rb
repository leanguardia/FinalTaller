require 'test_helper'

class SleepTest < ActiveSupport::TestCase

  setup do
    @sleep = sleeps(:one)
  end

   test "should get the difference" do
		difference = ((@sleep.awaken_at - @sleep.started_at) / 1.hour).round(2)	
    assert_equal(difference, @sleep.getDifference)
   end

   test "should set te awake time" do
     @sleep.awake
     @sleep2=@sleep
     assert_equal(@sleep,@sleep2)
  end
end
