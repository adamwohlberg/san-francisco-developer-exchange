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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauth_providers => [:facebook]

  unless Rails.env.test?
    geocoded_by :location
    #after_validation :geocode, :if => :location_changed?
  end

  validates :type, presence: true, inclusion: { in: %w(Employer Developer),
    message: "%{value} is not a valid type of user" }, unless: -> { from_omniauth? }
  validates :first_name, presence: true, unless: -> { from_omniauth? }
  # validates :email, presence: true, unless: -> { from_omniauth? }
  validates :location, presence: true, unless: -> { from_omniauth? }

  def self.from_omniauth(auth, params)
    user = where(email: auth.info.email).first
    if user.present?
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.fb_image = auth.info.image
      user.location = auth.info.location
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.skip_confirmation!
      user.save
    else
      user = where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.first_name = auth.info.first_name
        user.email = auth.info.email
        user.fb_image = auth.info.image
        user.location = auth.info.location
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.skip_confirmation!
        user.save
      end
    end
    user.update_attributes(type: params["type"]) if user && params && params["type"].present?
    return user
  end



=begin
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
       new(session["devise.user_attributes"], without_protection: true) do |user|
        user.user_attributes = params
        user.valid?
       end
    else
      super
    end
  end
=end


  def password_required?
    # don't require password if signing in through omniauth
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

private

def from_omniauth?
  provider && uid
end

end
