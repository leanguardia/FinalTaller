require 'test_helper'

class BandTest < ActiveSupport::TestCase
  test "should get times option array" do
    color = Array.new
    color << ["green", 2]
    color << ["red", 3]
    color << ["blue", 4]
    assert_equal(times, Band.get_color)
	end
end