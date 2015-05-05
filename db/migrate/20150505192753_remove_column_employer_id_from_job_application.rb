class RemoveColumnEmployerIdFromJobApplication < ActiveRecord::Migration
  def up
  	remove_column :job_applications, :employer_id
  end
  def down
  	add_column :job_applications, :employer_id, :integer
  end
end
