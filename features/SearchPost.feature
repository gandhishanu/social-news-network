Feature: Allow SocialNetwork user to add a new post

Scenario:  Search for posts (Declarative)
  When I have added a post with title "Testing" and body "This is only a test" and thumbnail "test"
  And I am on the SNN home page  
  And I search for "test"
  Then I should see a post entry with title "Testing" and body "This is only a test" and thumbnail "test"
