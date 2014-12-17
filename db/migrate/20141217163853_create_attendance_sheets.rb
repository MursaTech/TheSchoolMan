class CreateAttendanceSheets < ActiveRecord::Migration
  def change
    create_table :attendance_sheets do |t|
      t.references :student, index: true
      t.references :user, index: true
      t.references :stream, index: true
      t.boolean :present, default: false

      t.timestamps
    end
  end
end
