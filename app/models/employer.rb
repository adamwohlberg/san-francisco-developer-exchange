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

class Employer < User
  	acts_as_paranoid
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/noface"
    	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
    	validates_attachment_size :avatar, :in => 0.megabytes..2.megabytes

    scope :favorite, -> { where(:favorite == true) } 

	has_many :contracts, :dependent => :destroy
	has_many :negotiations, :dependent => :destroy
	has_many :developers, :through => :contracts
	has_many :ratings, :through => :contracts
	has_and_belongs_to_many :employer_favorites

	geocoded_by :location
  	after_validation :geocode, :if => :location_changed?
  	after_update :update_contracts_location

	def all_contracts_total
		contracts.sum(:amount)
	end

	def employer_favorites
		EmployerFavorite.where( employer: self )
	end

	def make_payment(amount, contract)
		Payment.create(amount: amount, contract_id: contract, employer_id: self.id)
	end

	def stars
		contracts.ratings.average(:employer)
	end

	def update_contracts_location
		self.contracts.each {|c| c.update_attributes(location: self.location)}
    end

	# def show_stars(ratings)
 #  		image_tag "#{review.rating}star.png"
	# end

end
