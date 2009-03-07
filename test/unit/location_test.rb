require 'test_helper'

class LocationTest < ActiveSupport::TestCase
 test "validates presence of name" do
    location = locations(:one)
    location.name = nil
    assert ! location.valid?
    assert location.errors.on(:name)
  end
 
  test "validate prescence of lat" do
    location = Location.new
    location.latitude = nil
    assert ! location.valid?
    assert location.errors.on(:latitude)
  end
  
   test "validate prescence of lon" do
    location = Location.new
    location.longitude = nil
    assert ! location.valid?
    assert location.errors.on(:longitude)
  end
  
  test "that latitude must be a number" do
    location = locations(:one)
    location.latitude = 'String'
    assert ! location.valid?
    assert location.errors.on(:latitude)
  end
  
  test "that longitude must be a number" do
    location = locations(:one)
    location.longitude = 'String'
    assert ! location.valid?
    assert location.errors.on(:longitude)
  end  
  
   test "has many groups" do
    assert locations(:one).groups, "should have groups association"
  end
  
  test "has many events" do
  	assert locations(:one).events, "should have events"
  end

 
end

