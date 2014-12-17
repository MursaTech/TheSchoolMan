class CreateExamResults < ActiveRecord::Migration
  def change
    create_table :exam_results do |t|
      t.references :stream, index: true
      t.references :exam, index: true
      t.references :student, index: true
      t.references :subject, index: true
      t.string :score
      t.string :grade

      t.timestamps
    end
  end
end
