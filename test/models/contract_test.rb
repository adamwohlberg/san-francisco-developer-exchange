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

require 'test_helper'

class ContractTest < ActiveSupport::TestCase
  test 'that a contract must have a title' do
  end

  test 'that a contract must have a name' do
  end

  test 'that a contract must have a description' do
  end

  test 'that employers can upload a contract document' do
  end

  test 'that employers must enter an EIN number' do
  end

  test 'that employers must enter a EIN number in a valid format' do
  end

  test 'that employers must enter a total contract amount' do
  end

  test 'that employers must enter a total contract amount great than $1000' do
  end

  test 'that employers must enter required skills for the contract' do
  end

  test 'that employers must agree to terms prior to submitting a contract' do
  end
end
