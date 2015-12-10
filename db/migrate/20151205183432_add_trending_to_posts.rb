class AddTrendingToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :trending, :float
    add_index :posts, :trending
  end
end
