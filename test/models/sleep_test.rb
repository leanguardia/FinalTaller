require 'test_helper'

class SleepTest < ActiveSupport::TestCase

  setup do
    @sleep = sleeps(:one)
  end

   test "should get the difference" do
		difference = ((@sleep.awaken_at - @sleep.started_at) / 1.hour).round(2)	
    assert_equal(difference, @sleep.getDifference)
   end
end
