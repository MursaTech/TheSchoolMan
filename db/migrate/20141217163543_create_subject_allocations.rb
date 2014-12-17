class CreateSubjectAllocations < ActiveRecord::Migration
  def change
    create_table :subject_allocations do |t|
      t.references :stream, index: true
      t.references :subject, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
