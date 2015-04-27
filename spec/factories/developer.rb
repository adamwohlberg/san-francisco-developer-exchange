FactoryGirl.define do
  factory :developer do
	first_name 'Developer'
    email 'developer@gmail.com' 
    password 'asdfjkl;'
    password_confirmation 'asdfjkl;' 
    location ["Montreal, QC","Los Angeles, CA", "Austin, TX","Las Vegas, NV","Tucson, AZ","Williamsburg, NY","San Francisco, CA","Santa Cruz, CA"].sample
    type "Developer"  
  end
end