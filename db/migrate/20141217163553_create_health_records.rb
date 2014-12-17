class CreateHealthRecords < ActiveRecord::Migration
  def change
    create_table :health_records do |t|
      t.references :student, index: true
      t.text :diagonosis
      t.string :prescription
      t.boolean :need_for_outside_referral
      t.references :user, index: true

      t.timestamps
    end
  end
end
