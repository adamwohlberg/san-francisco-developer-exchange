describe "the signin process", :js => true do
  it "Visit on home page" do
    visit '/'
    expect(page).to have_content 'GET STARTED'
  end

  it "visit on register page with home page" do
    visit '/'
    expect(page).to have_content 'GET STARTED'    
    click_link 'Register'
    expect(page).to have_content 'Signing up is easy and fun.'
  end

  it "Regiter with facebook as developer" do
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

  it "Regiter as developer without facebook" do
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

  it "Regiter as Employer without facebook" do
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

end