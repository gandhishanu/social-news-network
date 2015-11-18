class AddPasswordAndConfirmToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :string
    add_column :users, :password_confirm, :string
  end
end
