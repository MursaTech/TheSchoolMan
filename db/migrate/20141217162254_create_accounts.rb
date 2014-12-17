class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :email
      t.boolean :setup, :boolean, default: false
      t.references :user, index: true
      t.string :name

      t.timestamps
    end
    add_attachment :accounts, :photo
  end
end
