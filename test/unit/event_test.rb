require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "validates presence of name" do
    event = events(:seattle)
    event.name = nil
    assert ! event.valid?
    assert event.errors.on(:name)
  end
  
  test "has many locations" do
    assert events(:seattle).location, "should have location association"
  end
  
  test "has many groups" do
  	assert events(:seattle).group, "should have groups"
  end
  
  test "validates end time is after start time" do
    event = events(:seattle)
    event.start_time = '2009-02-28 13:30:54'
    event.end_time = '2009-02-28 12:30:54'
    assert ! event.valid?
    assert event.errors.on(:end_time)
    assert event.errors.on(:star_time)
  end
  
end
