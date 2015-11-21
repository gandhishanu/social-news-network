class Category < ActiveRecord::Base
  has_many :posts
  validates :name, :description, :thumbnail, :presence => true
end
