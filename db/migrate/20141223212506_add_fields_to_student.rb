class AddFieldsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :previous_school, :string
    add_column :students, :last_exam_score, :string
  end
end
