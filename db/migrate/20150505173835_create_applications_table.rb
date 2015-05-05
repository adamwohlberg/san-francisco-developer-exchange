class CreateApplicationsTable < ActiveRecord::Migration
  def change
	create_table "applications", force: true do |t|
	    t.datetime "created_at"
	    t.datetime "updated_at"
	    t.integer  "developer_id"
	    t.integer  "employer_id"
	    t.integer  "contract_id"
	    t.datetime "deleted_at"
	  end
	   add_index :applications, :deleted_at
  end

end


