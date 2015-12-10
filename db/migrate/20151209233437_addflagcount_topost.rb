class AddflagcountTopost < ActiveRecord::Migration
  def change
     add_column :posts, :flagcount, :integer, { default: 0 }
  end
end
