require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  
  test "validates presence of name" do
    group = Group.new
    assert ! group.valid?
    assert group.errors.on(:name)
  end
 
  test "name must be unique" do
    group = Group.new
    group.name = groups(:one).name
    assert ! group.valid?
    assert group.errors.on(:name)
  end
  
  test "has many locations" do
    assert groups(:one).locations, "should have location association"
  end
  
  test "has many events" do
  	assert groups(:one).events, "should have events"
  end
  
end
