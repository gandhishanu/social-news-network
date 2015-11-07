Feature: view the "Expanded" page for a post

Scenario:  Click on the "More about " link for a post to view expanded page

Given I have added a post with title "Yes sir" and body "Semper fi" and thumbnail "marine"

When I have visited the expanded page for the "Yes sir" post
Then I should see "Semper fi"
