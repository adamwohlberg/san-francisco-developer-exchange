require 'test_helper'

class DevelopersControllerTest < ActionController::TestCase
  setup do
    @developer = users(:jim)
    sign_in @developer
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:developers)
  end

  test "should get new" do
    get :new
    assert_response :assert_redirect 
    assert_redirected_to login_path
  end

  # test "should create developer" do
  #   assert_difference('Developer.count') do
  #     post :create, developer: {  }
  #   end

  #   assert_redirected_to developer_path(assigns(:developer))
  # end

  test "should show developer when you provide the id" do
    get :show, id: @developer
    assert_response :success
  end

  test "should show developer when you provide the profile name" do
    get :show, id: users(:jim).username
    assert_response :success
    assert_template 'developers/show'
  end

  test "should enter a 404 on profile not found" do
    get :show, id: "doesn't exist"
    assert_response :not_found
  end

  test "should get edit" do
    get :edit, id: @developer
    assert_response :success
  end

  test "should update developer" do
    patch :update, id: @developer, developer: {  }
    assert_redirected_to developer_path(assigns(:developer))
  end

  test "should destroy developer" do
    assert_difference('Developer.count', -1) do
      delete :destroy, id: @developer
    end

    assert_redirected_to developers_path
  end
end
