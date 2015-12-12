Feature: User should be able to see related posts

  As a user
  So that I can discover related content
  I want to be able to see similar posts to what I am viewing

  Scenario: If a user has up voted two posts they should show up as related
    Given a user liked "Post A" and "Post B"
    When I am viewing "Post A"
    Then I should see "Post B" as related

  Scenario: If a user has up voted two posts they should show up as related
    Given a user liked "Post A" and "Post B"
    When I am viewing "Post B"
    Then I should see "Post A" as related

  Scenario: Posts with more mutual up votes are more related than those with less mutual up votes
    Given "User A", "User B" and "User C" are registered
    And posts "Post A", "Post B" and "Post C" exist
    And "User A" up voted "Post A" and "Post B"
    And "User B" up voted "Post A" and "Post C"
    And "User C" up voted "Post A" and "Post C"
    When I am viewing "Post A"
    Then I should see "Post C" before "Post B" as related in related section
