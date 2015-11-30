class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :comment
  has_many :replies, foreign_key: "comment_id", class_name: "Comment"
  validates :comment, presence: false
  validates :user, presence: true
  validates :post, presence: true
  validates :body, :presence => true
end
