class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.references :account, index: true
      t.references :user, index: true
      t.boolean :is_preferred, :boolean, default: false

      t.timestamps
    end
  end
end
