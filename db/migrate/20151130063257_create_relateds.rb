class CreateRelateds < ActiveRecord::Migration
  def change
    create_table :relateds do |t|
      t.integer :post_id1
      t.integer :post_id2
      t.integer :frequency

      t.timestamps null: false
    end
  end
end
