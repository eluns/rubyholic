require 'test_helper'
 
class GroupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groups)
  end
  
  test "index should load no more than 10 groups" do
    assert Group.count > 10, "Test requires 11+ group fixtures"
    get :index
    assert_equal 10, assigns(:groups).size
  end

  test "order by group name name orders by group name" do
    get :index, :order_by => 'name'
    assert group_list = assigns(:groups)
    assert_equal group_list, group_list.sort_by { |group|
      group.name
    }
  end

  test "order by group name desc" do
    get :index, :order_by => 'name', :direction => 'desc'
    assert group_list = assigns(:groups)
    assert_equal group_list, group_list.sort_by { |group| group.name }.reverse
  end
 
  test "index can order groups by name" do
    get :index, :order_by => 'name'
    expected = Group.find(:all, :limit => 10, :order => 'name')
    assert_equal expected, assigns(:groups)
  end
 
  test "should get new" do
    get :new
    assert_response :success
  end
 
  test "should create group" do
    assert_difference('Group.count') do
      post :create, :group => { :name => 'new group' }
    end
 
    assert_redirected_to group_path(assigns(:group))
  end
 
  test "should show group" do
    get :show, :id => groups(:seattle).id
    assert_response :success
  end
 
  test "should get edit" do
    get :edit, :id => groups(:seattle).id
    assert_response :success
  end
 
  test "should update group" do
    put :update, :id => groups(:seattle).id, :group => { }
    assert_redirected_to group_path(assigns(:group))
  end
 
  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete :destroy, :id => groups(:seattle).id
    end
 
    assert_redirected_to groups_path
  end
  
 test "should get index sorted by name" do
    get :index, :sort => "name"
    assert_response :success
    assert_not_nil assigns(:groups)
 end

end
