require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "validates presence of name" do
    event = events(:one)
    event.name = nil
    assert ! event.valid?
    assert event.errors.on(:name)
  end
  
  test "has many locations" do
    assert events(:one).location, "should have location association"
  end
  
  test "has many groups" do
  	assert events(:one).group, "should have groups"
  end

end
