class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :id_number

      t.timestamps
    end
  end
end
