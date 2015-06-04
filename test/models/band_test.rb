require 'test_helper'

class BandTest < ActiveSupport::TestCase
  test 'should get a color array of 3 colors' do
    assert_equal(3, Band.get_color.count)
  end

  test 'should get array with band tyoes' do
    assert_equal(2, Band.get_types.count)
  end

end
