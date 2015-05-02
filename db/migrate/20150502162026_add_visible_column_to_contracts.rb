class AddVisibleColumnToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :visible, :boolean, default: true
  end
end
