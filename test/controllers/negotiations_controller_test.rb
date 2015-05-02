require 'test_helper'

class NegotiationsControllerTest < ActionController::TestCase
  # setup do
  #   @negotiation = negotiations(:one)
  # end

  test 'an employer must select a contract in order to disable to contact button and contact a developer' do
    assert false
  end

  test "when an employer contacts a developer, the EMPLOYER receives an EMAIL with a link to a page with the developer's private email information" do
    assert false
  end

  test "when an employer contacts a developer, the DEVELOPER receives an EMAIL with a link to a page with the employer's information" do
    assert false
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:negotiations)
  # end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create negotiation" do
  #   assert_difference('Negotiation.count') do
  #     post :create, negotiation: {  }
  #   end

  #   assert_redirected_to negotiation_path(assigns(:negotiation))
  # end

  # test "should show negotiation" do
  #   get :show, id: @negotiation
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get :edit, id: @negotiation
  #   assert_response :success
  # end

  # test "should update negotiation" do
  #   patch :update, id: @negotiation, negotiation: {  }
  #   assert_redirected_to negotiation_path(assigns(:negotiation))
  # end

  # test "should destroy negotiation" do
  #   assert_difference('Negotiation.count', -1) do
  #     delete :destroy, id: @negotiation
  #   end

  #   assert_redirected_to negotiations_path
  # end
end
