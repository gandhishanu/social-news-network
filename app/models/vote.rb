require 'simple_enum'
class Vote < ActiveRecord::Base
  include SimpleEnum
  belongs_to :post
  belongs_to :user
  as_enum :updown, upvote: 0, downvote: 1
end
