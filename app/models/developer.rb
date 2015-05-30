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

class Developer < User
  acts_as_paranoid
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/noface"
    validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg"] }
    validates_attachment_size :avatar, :in => 0.megabytes..3.megabytes

  has_and_belongs_to_many :skills, join_table: :developers_skills

  has_many :job_applications, :dependent => :destroy
  has_many :contracts, :dependent => :destroy
  has_many :negotiations, :dependent => :destroy
  has_many :employers, :through => :contracts
  has_many :ratings, :through => :contracts
  has_and_belongs_to_many :employer_favorites
	has_and_belongs_to_many :developer_favorites


	scope :php, -> { where(title: 'PHP Developer') }
	scope :ruby, -> { where(title: 'Ruby Developer') }
	scope :newest, -> { order('created_at DESC') }

	geocoded_by :location
  after_validation :geocode, :if => :location_changed?

  scope :php, -> { where(title: 'PHP Developer') }
  scope :ruby, -> { where(title: 'Ruby Developer') }
  scope :newest, -> { order('created_at DESC') }
  scope :favorite, -> { where(:favorite == true) }
  scope :complete, -> { where.not(:username => nil)}
  scope :has_image, -> { where.not(:avatar_file_name => nil)}

  validates_numericality_of :min_contract_amount, presence: true, :on => :update,
            greater_than_or_equal_to: 1000,
            less_than_or_equal_to: 225000
  validates :title, presence: true, :on => :update
  validates :username, presence: true, :on => :update,
                           uniqueness: true,
                           format:  {
                             with: /[a-z0-9_-]{3,15}/,
                             message: 'must be formatted correctly'
                           }
  validates :description, presence: true, :on => :update
  validates :min_contract_amount, presence: true, :on => :update
  # validates :cell, presence: true, :on => :update

  def skills_names
    skills.map &:name
    # .map {|r| r.name}
  end

  def skill_ids=(value)
    super value.reject(&:blank?).map(&:to_i)
  end

  def earnings
    total_payment = contracts.closed.sum(:total_payment)
    service_fee = contracts.closed.sum(:service_fee)
    return total_payment - service_fee
  end

  def calculate_level
    case
      when earnings.between?(0..24999.99)
        level = 1
      when earnings.between(25000..49999.99)
        level = 2
      when earnings >= 50000
        level = 3
    end
  end

  def developer_favorites
    DeveloperFavorite.where( developer: self )
  end

  def stars
    contracts.ratings.average(:developer)
  end

  def projects
    contracts.closed.count(:id)
  end

end
