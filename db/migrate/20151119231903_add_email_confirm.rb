class AddEmailConfirm < ActiveRecord::Migration
  def change
    add_column :users, :email_confirmed, :boolean, null: false, default: false
    add_column :users, :email_confirm_string, :string
  end
end
