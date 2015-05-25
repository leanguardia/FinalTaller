require 'test_helper'

class BandTest < ActiveSupport::TestCase
<<<<<<< HEAD
  test "should get times option array" do
    color = Array.new
    color << ["green", 2]
    color << ["red", 3]
    color << ["blue", 4]
    assert_equal(times, Band.get_color)
	end
end
=======
  test 'should get a color array of 3 colors' do
    assert_equal(3, Band.get_color.count)
  end

  test 'should get array with band tyoes' do
    assert_equal(2, Band.get_types.count)
  end

end
>>>>>>> 31ca62af1cbc7566072c14f22a045005e470a715
