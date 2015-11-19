class AddDescriptionAndThumbnailToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :description, :string
    add_column :categories, :thumbnail, :text
  end
end
