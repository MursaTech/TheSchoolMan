class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.datetime :dob
      t.string :admission_number
      t.references :account, index: true
      t.references :guradian, index: true

      t.timestamps
    end
    add_attachment :students, :photo
  end
end
