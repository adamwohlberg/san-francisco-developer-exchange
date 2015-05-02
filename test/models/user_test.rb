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

class UserTest < ActiveSupport::TestCase
  # *********************************************************************************************************
  # # Tests for initial REGISTRATION for devs or employers (if user does NOT login with the Facebook button)
  # *********************************************************************************************************

  test 'a user must select a user type as developer or employer unhappy path' do
    user = User.new(
      first_name: 'Bob',
      location: 'San Francisco, CA',
      type: '',
      email: 'bob@facerbook.com',
      password: 'asdfjkl;',
      password_confirmation: 'asdfjkl;'
    )
    assert !user.save
    assert !user.errors[:type].empty?
  end

  test 'a user must select a user type as developer or employer happy path' do
    user = User.new(
      first_name: 'Bob',
      location: 'San Francisco, CA',
      type: 'Developer',
      email: 'bob@facerbook.com',
      password: 'asdfjkl;',
      password_confirmation: 'asdfjkl;'
    )
    assert user.save
    assert user.errors[:type].empty?
  end

  test 'a user should enter a first name' do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test 'if a user does not add an email address the user cannot create a profile aka the unhappy path' do
    user = User.new(
      first_name: 'Bob',
      location: 'San Francisco, CA',
      type: 'Developer',
      password: 'asdfjkl;',
      password_confirmation: 'asdfjkl;'
    )
    assert !user.save
    assert !user.errors[:email].empty?
  end

  test 'if a user does add an email address the user can create a profile aka the happy path' do
    user = User.new(
      first_name: 'John',
      location: 'San Francisco, CA',
      type: 'Developer',
      email: 'foobar@barfoo.com',
      password: 'asdfjkl;',
      password_confirmation: 'asdfjkl;'
    )
    assert user.save
    assert user.errors[:email].empty?
  end

  test 'a user should enter a location' do
    user = User.new
    user.type = 'Developer'
    user.first_name = users(:jason).first_name
    user.email = 'poo@foo.com'
    user.location = users(:jason).location
    user.password = 'asdfjkl;'
    user.password_confirmation = 'asdfjkl;'
    user.encrypted_password = users(:jason).encrypted_password
    assert user.errors[:location].empty?
  end

  test 'a user must enter a password' do
    user = User.new(
      first_name: 'John',
      location: 'San Francisco, CA',
      type: 'Developer',
      email: 'foobar@barfoo.com',
      password: '',
      password_confirmation: 'asdfjkl;'
    )
    assert !user.save
    assert !user.errors[:password].empty?
  end

  test 'a user must confirm her password' do
    user = User.new(
      first_name: 'John',
      location: 'San Francisco, CA',
      type: 'Developer',
      email: 'foobar@barfoo.com',
      password: 'asdfjkl;',
      password_confirmation: 'foobar'
    )
    assert !user.save
    assert !user.errors[:password_confirmation].empty?
  end

  test 'new users are geocoded by location' do
  end
end
