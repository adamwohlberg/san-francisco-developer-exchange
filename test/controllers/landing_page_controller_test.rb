require 'test_helper'

class LandingPageControllerTest < ActionController::TestCase
  test "if user is signed_in as a developer, they skip the landing page and are redirected to the search contracts animation page" do
    sign_in users(:jim)
    assert_redirected_to(:controller => "search", :action => "searching_for_contracts")
    assert_template :searching_for_contracts
  end

   test "if user is signed_in as a employer they skip the landing page and are redirected to the search developers animation page" do
    sign_in users(:jason)
    assert_redirected_to(:controller => "search", :action => "searching_for_developers")
    assert_template :searching_for_developers
  end

  test "if the video doesn't load the user gets an image" do
    false
  end

end
