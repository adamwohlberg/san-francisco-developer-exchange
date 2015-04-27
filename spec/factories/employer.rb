FactoryGirl.define do
  factory :employer do
	first_name 'Employer'
    email 'employer@gmail.com' 
    password 'asdfjkl;'
    password_confirmation 'asdfjkl;' 
    location ["Montreal, QC","Los Angeles, CA", "Austin, TX","Las Vegas, NV","Tucson, AZ","Williamsburg, NY","San Francisco, CA","Santa Cruz, CA"].sample
    type "Employer"  
  end
end
