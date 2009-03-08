require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  
  test "validates presence of name" do
    group = Group.new
    assert ! group.valid?
    assert group.errors.on(:name)
  end
 
  test "name must be unique" do
    group = Group.new
    group.name = groups(:seattle).name
    assert ! group.valid?
    assert group.errors.on(:name)
  end
  
  test "has many locations" do
    assert groups(:seattle).locations, "should have location association"
  end
  
  test "has many events" do
  	assert groups(:seattle).events, "should have events"
  end
  
end
