# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  first_name              :string(255)
#  last_name               :string(255)
#  email                   :string(255)      default(""), not null
#  encrypted_password      :string(255)      default(""), not null
#  reset_password_token    :string(255)
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :string(255)
#  last_sign_in_ip         :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  username                :string(255)
#  latitude                :float(24)
#  longitude               :float(24)
#  location                :string(255)
#  ip                      :string(255)
#  relationship_type       :string(255)
#  star_rating             :integer
#  type                    :string(255)
#  company_name            :string(255)
#  title                   :string(255)
#  description             :text
#  ein                     :string(255)
#  image_path              :string(255)
#  min_contract_amount     :string(255)
#  min_full_time_amount    :string(255)
#  agree_to_terms          :boolean
#  balance                 :integer
#  cell                    :string(255)
#  full_time_option        :string(255)
#  verified                :string(255)
#  document_file_name      :string(255)
#  document_content_type   :string(255)
#  document_file_size      :integer
#  document_updated_at     :datetime
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  avatar_file_name        :string(255)
#  avatar_content_type     :string(255)
#  avatar_file_size        :integer
#  avatar_updated_at       :datetime
#  uid                     :string(255)
#  name                    :string(255)
#  oauth_token             :string(255)
#  oauth_expires_at        :datetime
#  provider                :string(255)
#

require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  test "that a developer's total payment is calculated" do
    developer = users(:jason)
    assert developer.save
    assert developer.earnings == 7000, developer.earnings
  end

  test "that a developer's service_fee is calculated" do
    developer = users(:jason)
    assert developer.save
    assert developer.service_fee == 0, developer.service_fee
  end

  test "that a developer's earnings are calculated" do
    developer = users(:jason)
    assert developer.save
    assert developer.earnings == 7000, developer.earnings
    assert developer.service_fee == 0, developer.service_fee
    assert developer.earnings == (developer.earnings - developer.service_fee)
  end

  test 'that a developer chooses her type form a drop down' do
    user = Users(:developer)
    user.title = 'Foobar'
    assert !user.save
    assert !user.errors[:title].empty?
  end

  test 'that a user enters a username' do
    user = User.new(
      first_name: 'Bob',
      location: 'San Francisco, CA',
      type: '',
      email: 'bob@facerbook.com',
      password: 'asdfjkl;',
      password_confirmation: 'asdfjkl;'
    )
    user = User.update(
      username: 'Foobar'
    )
    assert !user.save
    assert !user.errors[:username].empty?
  end

  test 'that a user should have a unique profile name' do
    user = User.new(
      first_name: 'Bob',
      location: 'San Francisco, CA',
      type: 'Developer',
      email: 'bob@facerbook.com',
      password: 'asdfjkl;',
      password_confirmation: 'asdfjkl;'
    )
    user.username = 'dev_flunkr'
    assert !user.save
    assert !user.errors[:username].empty?
  end

  test 'that a developer must have a title selected from a list' do
  end

  test 'that a developer must enter a professional summary description' do
  end

  test 'that a developer must enter a minimum contract amount' do
  end

  test 'that a developer must enter a cell phone number' do
  end

  test 'that a developer must enter a PayPal email' do
  end

  test 'that a developer can upload a profile image' do
  end

  test 'that a developer must enter his skills from checkboxes' do
  end

  test 'that a developer must agree to terms and conditions before saving his profile' do
  end
end
