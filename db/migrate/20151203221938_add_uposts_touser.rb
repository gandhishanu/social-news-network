class AddUpostsTouser < ActiveRecord::Migration
  def change
    add_reference :users, :posts, index: true, foreign_key: true
  end
end
