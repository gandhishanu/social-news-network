class Vote < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  as_enum :updown, [:upvote, :downvote], map: :string
end
