class Post < ActiveRecord::Base
  belongs_to :category
  has_many :votes
  has_many :comments
  has_many :relateds, foreign_key: :post_id1
  has_many :related_posts, through: :relateds, source: :related_post2

  def overall_votes
    upvotes = votes.where(updown_cd: 0).count
    downvotes = votes.where(updown_cd: 1).count
    return upvotes - downvotes
  end

  def is_voted_by_user(current_user, updown)
    if current_user.nil?
      return false
    end
    return votes.where(updown_cd: updown, user_id: current_user.id).count == 1
  end
end
