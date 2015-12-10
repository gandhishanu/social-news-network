Feature: Sort posts using Reddit's trending posts algorithm

  As a user
  So that I can view all the trending posts
  I want to see posts sorted by Reddit’s popularity algorithm on the main page

  Scenario: Posts with equal votes but different creation time sort by newest first
    Given there are 10 posts with 10 upvotes and 1 downvotes each created on different dates
    When I am on home page
    Then I should see newest posts first

  Scenario: Posts with same creation time but different up votes should sort by more votes first
    Given there are 10 posts created on same date but different number of upvotes
    When I am on home page
    Then I should see posts with most up votes first
