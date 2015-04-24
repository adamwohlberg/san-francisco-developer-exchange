require 'test_helper'

class SearchControllerTest < ActionController::TestCase
# HAPPY PATH
   test "if current user is a developer they are shown searching for contracts" do
   sign_in user(:developer) 
   assert template :searching_for_contracts
   end

   test "users on the searching for contracts page are redirected to contracts#index"
   get '/searching_for_contracts'
   assert_redirected_to(:controller => "contracts", :action => "index")
   end

   test "if current user is an employer they are shown searching for developers" do
   sign_in user(:employer) 
   assert template :searching_for_developers
   end

   test "users on the searching for developers page are redirected to contracts#index"
   get '/searching_for_developers'
   assert_redirected_to(:controller => "developers", :action => "index")
   end

# UNHAPPY PATH
   test "if current user is a developer and they try to get to the developers search page, they are redirected to root" do
   sign_in user(:developer)
   get 'searching_for_developers'
   assert_redirected_to :root
   end

   test "if current user is a employer and they try to get to the employer search page, they are redirected to root" do
   sign_in user(:employer) 
   get 'searching_for_contracts'
   assert_redirected_to :root
   end 
end
