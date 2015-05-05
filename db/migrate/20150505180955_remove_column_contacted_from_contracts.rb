class RemoveColumnContactedFromContracts < ActiveRecord::Migration
  def change
  	remove_column :contracts, :contacted
  end
end
