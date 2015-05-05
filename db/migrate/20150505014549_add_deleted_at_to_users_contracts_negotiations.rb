class AddDeletedAtToUsersContractsNegotiations < ActiveRecord::Migration
  def change
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
    add_column :contracts, :deleted_at, :datetime
    add_index :contracts, :deleted_at
    add_column :negotiations, :deleted_at, :datetime
    add_index :negotiations, :deleted_at
    add_column :payments, :deleted_at, :datetime
    add_index :payments, :deleted_at
    add_column :payment_notifications, :deleted_at, :datetime
    add_index :payment_notifications, :deleted_at
    add_column :ratings, :deleted_at, :datetime
    add_index :ratings, :deleted_at
    add_column :negotiation_messages, :deleted_at, :datetime
    add_index :negotiation_messages, :deleted_at
  end
end
