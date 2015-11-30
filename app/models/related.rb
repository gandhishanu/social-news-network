class Related < ActiveRecord::Base
  belongs_to :related_post1, foreign_key: :post_id1, class_name: :Post
  belongs_to :related_post2, foreign_key: :post_id2, class_name: :Post
end
