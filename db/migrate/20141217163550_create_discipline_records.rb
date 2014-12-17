class CreateDisciplineRecords < ActiveRecord::Migration
  def change
    create_table :discipline_records do |t|
      t.references :student, index: true
      t.string :offense
      t.string :punishment
      t.string :level

      t.timestamps
    end
  end
end
