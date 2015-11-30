class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :post, presence: true
  validates :user, presence: true
  validates :updown_cd, numericality: { only_integer: true, less_than_or_equal_to: 1, greater_than_or_equal_to: 0 }
end
