Feature: User should be able to view all categories in the category index

  As a user
  So that I can view available categories
  I want to be able to see all categories

  Scenario: User should be able to view all categories
    Given there exists "Category A" category
    And there exists "Category B" category
    And there exists "Category C" category
    When I view the category index
    And I should see "Category A" in category index
    And I should see "Category B" in category index
    And I should see "Category C" in category index