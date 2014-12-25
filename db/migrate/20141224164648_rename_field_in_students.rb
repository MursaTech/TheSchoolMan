class RenameFieldInStudents < ActiveRecord::Migration
  def change
  	rename_column :students, :guradian_id, :guardian_id
  end
end
