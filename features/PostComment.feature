Feature: Logged in user should be able to post comments

  As a registered user
  So that I can respond to a post with my opinion
  I want to be able to add comments to a post using my account

  Scenario: Post comment on an article
    Given "User A", "User B" and "User C" are registered
    And posts "Post A", "Post B" and "Post C" exist