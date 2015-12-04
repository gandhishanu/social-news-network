class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :thumbnail
      t.timestamps null: false
      t.references :user
    end
  end
end
