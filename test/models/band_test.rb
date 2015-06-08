require 'test_helper'

class BandTest < ActiveSupport::TestCase

	test "should not save band without type and color" do
	  bandtest = Band.new
	  assert_not bandtest.save, "Saved the band without a type and color"
	end

	test 'should get types option array' do
	    types = Array.new
	    types << ['Pro', 1]
	    types << ['Light', 2]
	    assert_equal(types, Band.get_types)
  	end


  	test 'should get colors option array' do
	    colors = Array.new
	    colors << ['Blue', 1]
	    colors << ['Green', 2]
	    colors << ['Red', 3]
	    assert_equal(colors, Band.get_color)
 	end

 	test 'should set values for select 1 to blue' do
    	band = Band.new
    	band.color = '1'
    	assert_equal(band.set_values,'blue')
    end

    test 'should set values for select 2 to green' do
    	band = Band.new
    	band.color = '2'
    	assert_equal(band.set_values,'green')
    end

    test 'should set values for select 3 to red' do
    	band = Band.new
    	band.color = '3'
    	assert_equal(band.set_values,'red')
    end

    test 'should set values for select otherwise to blue ' do
    	band = Band.new
    	band.color = '5'
    	assert_equal(band.set_values,'blue')
    end

end
