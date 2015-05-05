class AddColumnContactedToContracts < ActiveRecord::Migration
  def change
  	add_column :contracts, :contacted, :boolean, :default => false
  end
end
