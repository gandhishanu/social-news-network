class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :updown_cd
      t.integer :user_id
      t.integer :post_id

      t.timestamps null: false
    end
  end
end
