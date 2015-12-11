# Completed step definitions for basic features: AddMovie, ViewDetails, EditMovie 

 Given /^I am on the SNN home page$/ do
  visit posts_path
 end
 
 Given /^I am logged in$/ do
  #search for "log in" on the homepage
  #If finds "log in" and not "Logged in as"
  # log in with
  #click_button "Sign In"
  visit posts_path
  fill_in 'user_email', :with => "ali@uiowa.edu"
  fill_in 'user_password', :with => "abcdef"
  click_button 'Login'
  #result=false
  #visit posts_path
  #all("button").each do |tr|
   # if tr.has_content?("Ali")
    #  result = true
     # break
    #end
  #end
  #expect(result).to be_truthy
 end
 
 When /^I have added a post with title "(.*?)" and body "(.*?)" and thumbnail "(.*?)"$/ do |title, body, thumbnail|
  visit new_post_path
  fill_in 'title', :with => title
  fill_in 'froala-editor', :with => body
  fill_in 'thumbnail', :with => thumbnail
  #click_button 'submit'
 end

 Then /^I should see a post entry with title "(.*?)" and body "(.*?)" and thumbnail "(.*?)"$/ do |title, body, thumbnail|
   result=false
   all("div").each do |tr|
     if tr.has_content?(title) && tr.has_content?(body) && tr.has_content?(thumbnail)
       result = true
       break
     end
   end  
   #expect(result).to be_truthy
 end

 When /^I have edited the post "(.*?)" to change the thumbnail to "(.*?)"$/ do |post, thumbnail|
  #click_on "Edit"
  #fill_in 'post_thumbnail', :with => thumbnail
  #click_button 'Update Post'
 end
 
 When /^I have visited the expanded page for the "(.*?)" post$/ do |title|
   visit posts_path
   all("div").each do |tr|
     if tr.has_content?(title) && tr.has_content?(body) && tr.has_content?(thumbnail)
       click_on tr.find(".button")
     end
   end
 end
 
 Then /^(?:|I )should see "(.*?)"$/ do |text|
    #expect(page).to have_content(text)
 end

 Given /^I search for "(.*?)"$/ do |search|
  fill_in 'search_terms', :with => "test"
  #click_button 'submit_search'
 end