require 'test_helper'

class OmniauthCallbacksControllerTest < ActionController::TestCase
  # ************
  # register
  # ************

  test 'register - that an employer is unable to use the FB login' do
    # sign_in with Facebook
    assert template :searching_for_contracts
    false
  end

  test 'register - that a new developer can register with the Facebook login button' do
    # sign_in with Facebook
    assert template :searching_for_contracts
  end

  test 'register - that a new developer can register with the Facebook and their first_name is set' do
    # sign_in with Facebook
    assert template :searching_for_contracts
    false
  end

  test 'register - that a new developer can register with the Facebook and their email is set' do
    # sign_in with Facebook
    assert template :searching_for_contracts
    false
  end

  test 'register - that a new developer can register with the Facebook and their location is set' do
    # sign_in with Facebook
    assert template :searching_for_contracts
    false
  end

  test 'register - that a new developer can register with the Facebook and their password is set' do
    # sign_in with Facebook
    assert template :searching_for_contracts
    # is their password set???
    false
  end

  test "register - that a new developer's location is geocoded and latitude and longitude set" do
    # sign_in with Facebook
    # assert template :searching_for_contracts
    false
  end

  # ************
  # sign_in
  # ************

  test 'sign-in - that a returning DEVELOPER can login with the FB button' do
    # sign_in with Facebook
    # assert template :searching_for_contracts
    false
  end

  test 'sign-in - that a returning EMPLOYER can login with the FB button' do
    # sign_in with Facebook
    # assert template :searching_for_contracts
    # Can they?
    false
  end
end
