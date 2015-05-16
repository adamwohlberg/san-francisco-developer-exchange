class AddContractAvatarToContracts < ActiveRecord::Migration
  def self.up
    add_attachment :contracts, :contract_avatar
  end

  def self.down
    remove_attachment :contracts, :contract_avatar
  end
end
