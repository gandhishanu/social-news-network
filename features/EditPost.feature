Feature: edit an existing post

Scenario: Edit a post from the SNN App

 Given I have added a movie with title "Testing" and body "This is only a test" and thumbnail "test"
 And I have visited the expanded page for the "Testing" post

 When I have edited the post "Testing" to change the thumbnail to "edit"
 And I am on the SNN home page
 Then I should see a post entry with title "Testing" and body "This is only a test" and thumbnail "edit"
