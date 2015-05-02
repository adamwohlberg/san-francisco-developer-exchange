class DeleteColumnProfileNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile_name
  end
end
