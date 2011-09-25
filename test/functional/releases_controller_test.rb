require 'test_helper'

class ReleasesControllerTest < ActionController::TestCase
  setup :activate_authlogic
  
  test "index html" do
    get :index
    assert_response :success
    assert_select 'h1','Releases'
  end
  
  test "index xml" do
    get :index, {'format' => 'xml'}
    assert_response :success
    
    assert_select 'releases' do
      assert_select 'release'
    end
  end
  
  test "new not authorized" do
    get :new
    assert_redirected_to releases_path
    assert_equal 'Only logged in admins an access this page.',flash[:error]
  end
  
  test "new authorized" do
    AdminSession.create(:login => 'mike', :password => 'touch')
    get :new
    assert_response :success
    assert_select 'h1', 'Add New Release'
  end
end
