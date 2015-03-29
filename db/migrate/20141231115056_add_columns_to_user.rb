class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :id_number, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :user_type, :string
    add_column :users, :gender, :string
    add_column :users, :is_support, :boolean, default: false
    add_column :users, :is_admin, :boolean, default: false
    add_attachment :users, :photo
  end
end
