class Flagposttopost < ActiveRecord::Migration
  def change
    add_column :posts, :flagpost, :boolean
  end
end
