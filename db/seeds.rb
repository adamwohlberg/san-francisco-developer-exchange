include Faker

if Rails.env.development?
  20.times do 
  Developer.create!([
    {first_name: Name.first_name, 
      last_name: Name.last_name,
      email: Internet.email, 
      password: 'asdfjkl;', 
      password_confirmation: 'asdfjkl;', 
      reset_password_token: nil, 
      reset_password_sent_at: nil, 
      remember_created_at: nil, 
      sign_in_count: 62, 
      current_sign_in_at: "2015-02-27 21:26:32", 
      last_sign_in_at: "2015-02-27 19:34:09", 
      current_sign_in_ip: "127.0.0.1", 
      last_sign_in_ip: "127.0.0.1", 
      username: Internet.user_name,   
      location: ["Montreal, QC","Los Angeles, CA", "Austin, TX","Las Vegas, NV","Tucson, AZ","Williamsburg, NY","San Francisco, CA","Santa Cruz, CA"].sample, 
      ip: nil, 
      type: "Developer", 
      company_name: nil, 
      title: "PHP Developer", 
      description: Lorem.paragraph(20), 
      ein: Company.ein, 
      fb_image: nil, 
      min_contract_amount: rand(500..10000), 
      agree_to_terms: true, 
      balance: 0, 
      cell: PhoneNumber.cell_phone, 
      full_time_option: nil, 
      verified: "verified",
      avatar: File.new("#{Rails.root}/app/assets/images/"+rand(1..7).to_s+".jpg")}
  ])
  end

  Developer.create!([
    {first_name: 'Developer', 
      last_name: Name.last_name,
      email: 'developer@gmail.com', 
      password: 'asdfjkl;', 
      password_confirmation: 'asdfjkl;', 
      reset_password_token: nil, 
      reset_password_sent_at: nil, 
      remember_created_at: nil, 
      sign_in_count: 62, 
      current_sign_in_at: "2015-02-27 21:26:32", 
      last_sign_in_at: "2015-02-27 19:34:09", 
      current_sign_in_ip: "127.0.0.1", 
      last_sign_in_ip: "127.0.0.1", 
      username: Internet.user_name,  
      latitude: 37.7749, 
      longitude: -122.419, 
      location: ["Montreal, QC","Los Angeles, CA", "Austin, TX","Las Vegas, NV","Tucson, AZ","Williamsburg, NY","San Francisco, CA","Santa Cruz, CA"].sample, 
      ip: nil, 
      type: "Developer", 
      company_name: nil, 
      title: "PHP Developer", 
      description: Lorem.paragraph(20), 
      ein: Company.ein, 
      fb_image: nil, 
      min_contract_amount: rand(500..10000), 
      agree_to_terms: true, 
      balance: 0, 
      cell: PhoneNumber.cell_phone, 
      full_time_option: nil, 
      verified: "verified",
      avatar: File.new("#{Rails.root}/app/assets/images/"+rand(1..7).to_s+".jpg")}
  ])

  20.times do 
  Employer.create!([
    {first_name: Name.first_name, 
      last_name: Name.last_name, 
      email: Internet.email, 
      password: 'asdfjkl;', 
      password_confirmation: 'asdfjkl;', 
      reset_password_token: nil, 
      reset_password_sent_at: nil, 
      remember_created_at: nil, 
      sign_in_count: 62, 
      current_sign_in_at: "2015-02-27 21:26:32", 
      last_sign_in_at: "2015-02-27 19:34:09", 
      current_sign_in_ip: "127.0.0.1", 
      last_sign_in_ip: "127.0.0.1", 
      username: Internet.user_name, 
      location: ["Montreal, QC","Los Angeles, CA", "Austin, TX","Las Vegas, NV","Tucson, AZ","Williamsburg, NY","San Francisco, CA","Santa Cruz, CA"].sample, 
      ip: nil,  
      type: "Employer", 
      company_name: Company.name, 
      title: nil, 
      description: Company.bs, 
      ein: Company.ein, 
      fb_image: nil, 
      min_contract_amount: nil, 
      agree_to_terms: true, 
      balance: 0, 
      cell: PhoneNumber.cell_phone, 
      full_time_option: nil, 
      verified: "verified",
      avatar: File.new("#{Rails.root}/app/assets/images/"+rand(1..7).to_s+".jpg")}
  ])
  end

  Employer.create!([
    {first_name: 'Employer', 
      last_name: Name.last_name, 
      email: 'employer@gmail.com', 
      password: 'asdfjkl;', 
      password_confirmation: 'asdfjkl;', 
      reset_password_token: nil, 
      reset_password_sent_at: nil, 
      remember_created_at: nil, 
      sign_in_count: 62, 
      current_sign_in_at: "2015-02-27 21:26:32", 
      last_sign_in_at: "2015-02-27 19:34:09", 
      current_sign_in_ip: "127.0.0.1", 
      last_sign_in_ip: "127.0.0.1", 
      username: Internet.user_name, 
      latitude: 37.7749, 
      longitude: -122.419, 
      location: ["Montreal, QC","Los Angeles, CA", "Austin, TX","Las Vegas, NV","Tucson, AZ","Williamsburg, NY","San Francisco, CA","Santa Cruz, CA"].sample, 
      ip: nil,  
      type: "Employer", 
      company_name: Company.name, 
      title: nil, 
      description: Company.bs, 
      ein: Company.ein, 
      fb_image: nil, 
      min_contract_amount: rand(500..50000), 
      agree_to_terms: true, 
      balance: 0, 
      cell: PhoneNumber.cell_phone, 
      full_time_option: nil, 
      verified: "verified",
      avatar: File.new("#{Rails.root}/app/assets/images/"+rand(1..7).to_s+".jpg")}
  ])

  i = 500
  20.times do
  Contract.create!([
    {name: Company.bs,
     description: Lorem.paragraph(20),
     amount: rand(9000..20000),
     location: ["Montreal, QC","Los Angeles, CA", "Austin, TX","Las Vegas, NV","Tucson, AZ","Williamsburg, NY","San Francisco, CA","Santa Cruz, CA"].sample, 
     title: Lorem.sentence,
     employer_id: [22,23,24,42].sample,
     developer_id: nil,
     company: Company.name,
     agree_to_terms: true,
     relationship_type: nil,
     image: nil,
     latitude: nil,
     longitude: nil,
     ein: Company.ein,
     balance: nil,
     total_payment: nil,
     service_fee: nil,
     paid: false}
  ]) { |t| t.id = i + 1 }
  i = i + 1
  end

  {
    'Backend' =>
      ['PHP', 'Ruby', 'Java', 'Objective-C', 'Swift', '.NET', 'Python','Golang'],
    'Frontend' =>
      ['HTML', 'CSS', 'Javascript', 'jQuery', 'AngularJS', 'BackboneJS', 'EmberJS'],
    'Frontend Frameworks' =>
      ['Foundation', 'Bootstrap', 'Meteor', 'Phonegap'],
    'Databases' =>
      ['MySQL', 'Postgres', 'MongoDB', 'SQL', 'CouchDB'],
    'Backend Frameworks' =>
      ['Rails', 'Laravel', 'CakePHP', 'Wordpress'],
    'Other Coding SKills' =>
      ['Git', 'GitHub', 'Coffeescript', 'Sass', 'LESS'],
    'Design' =>
      ['Photoshop', 'Illustator'],
  }.each_with_index do |e, i|
    cat = SkillCategory.create name: e.first, position: i
    e.last.each_with_index { |s, p| cat.skills.create name: s, position: p }
  end

  Contract.all.each do |c|
    c.skills << Skill.offset(rand(Skill.count)).first(15)
  end

  Developer.all.each do |d|
    d.skills << Skill.offset(rand(Skill.count)).first(15)
  end

  EmployerFavorite.create!([
    {employer_id: 42, developer_id: 1},
    {employer_id: 42, developer_id: 3},
    {employer_id: 42, developer_id: 5},
    {employer_id: 42, developer_id: 7},
    {employer_id: 42, developer_id: 9},
    {employer_id: 42, developer_id: 11},
    {employer_id: 42, developer_id: 13},
    {employer_id: 42, developer_id: 15},
    {employer_id: 42, developer_id: 19},
    {employer_id: 42, developer_id: 27},
    {employer_id: 42, developer_id: 29},
    {employer_id: 42, developer_id: 31},
    {employer_id: 42, developer_id: 35},
    {employer_id: 42, developer_id: 39}
  ])
end


if Rails.env.production?
  {
    'Backend' =>
      ['PHP', 'Ruby', 'Java', 'Objective-C', 'Swift', '.NET', 'Python'],
    'Frontend' =>
      ['HTML', 'CSS', 'Javascript', 'jQuery', 'AngularJS', 'BackboneJS', 'EmberJS'],
    'Frontend Frameworks' =>
      ['Foundation', 'Bootstrap', 'Meteor', 'Phonegap'],
    'Databases' =>
      ['MySQL', 'Postgres', 'MongoDB', 'SQL', 'CouchDB'],
    'Backend Frameworks' =>
      ['Rails', 'Laravel', 'CakePHP', 'Wordpress'],
    'Other Coding SKills' =>
      ['Git', 'GitHub', 'Coffeescript', 'Sass', 'LESS'],
    'Design' =>
      ['Photoshop', 'Illustrator'],
  }.each_with_index do |e, i|
    cat = SkillCategory.create name: e.first, position: i
    e.last.each_with_index { |s, p| cat.skills.create name: s, position: p }
  end
end

