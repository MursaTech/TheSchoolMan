class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :name
      t.references :form, index: true
      t.references :user, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end
