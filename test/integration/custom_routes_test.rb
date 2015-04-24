require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest

	test "that /login route opens the login page" do 
		get 'login'
		assert_response :success
	end

	test "that /register route opens the register page" do 
		get 'register'
		assert_response :success
	end

	test "that /logout route redirects to destroy" do
		get 'logout'
		assert_response :redirect
		assert_redirected_to '/' 
 	end

	test "should route to developer show" do
	   assert_routing '/developers/1', { controller: "developers", action: "show", id: "1" }
	end

	test "should route to contract show" do
	   assert_routing '/contracts/1', { controller: "contracts", action: "show", id: "1" }
	end
	 
	test "should route to developer index" do
	   assert_routing '/developers', { controller: "developers", action: "index"}
	end

	test "should route to contract index" do
	   assert_routing '/contracts', { controller: "contracts", action: "index"}
	end
	 


































end


