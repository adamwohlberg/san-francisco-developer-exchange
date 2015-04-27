require 'spec_helper'

describe "the signin process", :js => true do
  it "Displays the correct landing page" do
    visit '/'
    expect(page).to have_content 'GET STARTED'
  end

  it "Correctly displays the register page when the register link in the header is clicked" do
    visit '/'
    expect(page).to have_content 'GET STARTED'    
    click_link 'Register'
    expect(page).to have_content 'Signing up is easy and fun.'
  end

  it "Allows users of type develper to register with the facebook login button" do
    visit '/'
    expect(page).to have_content 'GET STARTED'    
    click_link 'Register'
    expect(page).to have_content 'Signing up is easy and fun.'
    page.find("#facebook_button_register_page a.popup").click
    within_window "Log In | Facebook" do
      fill_in 'Email:', with: ""
      fill_in 'Password:', with: ""
      click_button "Log In"
      # synchronization makes this never return, maybe because
      # it's running in a different window?
      without_resynchronize { click_button "Allow" }
    end   
  end

  it "Allows users of type employer to register with the facebook login button" do
    visit '/'
    expect(page).to have_content 'GET STARTED'    
    click_link 'Register'
    expect(page).to have_content 'Signing up is easy and fun.'
    fill_in 'user_first_name', with: "test"
    fill_in 'user_email', with: "test@mailinator.com"
    fill_in 'user_location', with: "test"
    fill_in 'user_password', with: "12345678"
    fill_in 'user_password_confirmation', with: "12345678"
    click_button "Sign Up"
    expect(page).to have_content 'Searching for contracts near you...'
  end

  it "Regiter with facebook as employer" do
    visit '/'
    expect(page).to have_content 'GET STARTED'    
    click_link 'Register'
    expect(page).to have_content 'Signing up is easy and fun.'
    page.find("#type_Employer").click
    page.find("#facebook_button_register_page a.popup").click
    within_window "Log In | Facebook" do
      fill_in 'Email:', with: ""
      fill_in 'Password:', with: ""
      click_button "Log In"
      # synchronization makes this never return, maybe because
      # it's running in a different window?
      without_resynchronize { click_button "Allow" }
    end   
  end

  it "Allows users of type employer to register with the facebook login button" do
    visit '/'
    expect(page).to have_content 'GET STARTED'    
    click_link 'Register'
    expect(page).to have_content 'Signing up is easy and fun.'
    page.find("#type_Employer").click
    fill_in 'user_first_name', with: "test"
    fill_in 'user_email', with: "test@mailinator.com"
    fill_in 'user_location', with: "test"
    fill_in 'user_password', with: "12345678"
    fill_in 'user_password_confirmation', with: "12345678"
    click_button "Sign Up"
    expect(page).to have_content 'Searching for developers near you...'
  end

 it "Provides a profile image filler image when users first register via the form and thus do not provide an image" do
    visit '/'
    expect(page).to have_content 'GET STARTED'    
    click_link 'Register'
    expect(page).to have_content 'Signing up is easy and fun.'
    page.find("#type_Developer").click
    fill_in 'user_first_name', with: "test"
    fill_in 'user_email', with: "test1@mailinator.com"
    fill_in 'user_location', with: "test"
    fill_in 'user_password', with: "12345678"
    fill_in 'user_password_confirmation', with: "12345678"
    click_button "Sign Up"
    visit search_contracts_path 
    page.find("#profileImage")['src'] == "http://localhost:3000/images/noface.jpg"
  end

  it "Displays an index page of developers when the user logs in as an employer" do
    FactoryGirl.create(:employer)
    visit '/'
    expect(page).to have_content 'GET STARTED'    
    click_link 'Already a Member? Sign In'
    expect(page).to have_content 'Sign in'
    fill_in 'user_email', with: "employer@gmail.com"
    fill_in 'user_password', with: "asdfjkl;"
    click_button "Log in"
    visit search_developers_path
    byebug
  end

end

