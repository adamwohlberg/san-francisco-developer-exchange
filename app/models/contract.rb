# == Schema Information
#
# Table name: contracts
#
#  id                      :integer          not null, primary key
#  name                    :string(255)
#  description             :text
#  amount                  :integer
#  title                   :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  employer_id             :integer
#  developer_id            :integer
#  company                 :string(255)
#  contract_type           :string(255)
#  agree_to_terms          :boolean
#  remote_work_status      :string(255)
#  equity                  :boolean
#  relationship_type       :string(255)
#  image                   :string(255)
#  ein                     :string(255)
#  complete                :boolean
#  balance                 :integer
#  total_payment           :integer
#  service_fee             :integer
#  status                  :string(255)      default("open")
#  document_id             :integer
#  location                :string(255)
#  latitude                :float(24)
#  longitude               :float(24)
#  paid                    :boolean          default(FALSE)
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  paid_at                 :datetime
#  skills                  :text
#

class Contract < ActiveRecord::Base
  has_attached_file :attachment
  validates_attachment_content_type :attachment, :content_type => [ 'application/pdf', 'application/msword',
    'application/vnd.openxmlformats-officedocument.wordprocessingml.document' ]
  validates_with AttachmentSizeValidator, :attributes => :attachment, :less_than => 2.megabytes

  belongs_to :employer
  belongs_to :developer

  has_and_belongs_to_many :skills
  has_and_belongs_to_many :developer_favorites

  has_many :payments
  has_many :payment_notifications
  # this is for after the paypal payment
  # after_save :assign_developer_level

  has_many :ratings
  has_many :negotiations

  before_create :calculate_total_payment!
  before_create :calculate_service_fee!

  scope :paid, -> { where(paid: true) }
  scope :unpaid, -> { where(paid: false) }
  scope :open, -> { where(status: 'open') }
  scope :closed, -> { where(status: 'closed') }

  validates :title, presence: true
  validates :name, presence: true
  validates :description, presence: true


  validates_numericality_of :amount, presence: true,
            greater_than_or_equal_to: 500,
            less_than_or_equal_to: 225001
  validates :ein, presence: true, 
                           format:  {
                             with: /[1-9]\d?-\d{7}/,
                             message: 'please enter a valid employer identification number'
                           }

  geocoded_by :location
  after_validation :geocode, :if => :location_changed?
 
  COMMISSION = 0.20

  def calculate_total_payment!
    self.total_payment = amount * (1 + COMMISSION)
  end

  def calculate_service_fee!
    self.service_fee = amount * COMMISSION
  end

  def skills_names
    skills.map &:name
    # .map {|r| r.name}
  end

  def make_payment
    # update the payment table amount attribute with the contracts total_payment
    self.status = 'paid'
    self.balance = -(total_payment)
  end

# after the PayPal payment callback the contract is updated with a developer_id. after_save this will be run
  # def assign_developer_level
  #   if developer.present?
  #    developer.update_attributes(level: developer.calculate_level) 
  #   end
  # end

  def paypal_url(amount, return_path, notify_url)
    paypal_url = Rails.application.secrets[:paypal_host] || ENV["paypal_host"]
    values = {
      business: ENV["PAYPAL_BUSINESS_EMAIL"] || Rails.application.secrets[:PAYPAL_BUSINESS_EMAIL],
      cmd: "_xclick",
      upload: 1,
      return: return_path,
      invoice: id,
      amount: amount,
      item_name: 'Developer Services',
      quantity: '1',
      notify_url: notify_url
    }
    "#{paypal_url}/cgi-bin/webscr?#{values.to_query}"
   end
end






