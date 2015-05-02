class AddDefaultLocation < ActiveRecord::Migration
  def change
    change_column :users, :location, :string, default: 'Hanalei, HI'
  end
end
