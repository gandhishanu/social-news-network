# Completed step definitions for basic features: AddMovie, ViewDetails, EditMovie 

Given /^I am on the SNN home page$/ do
  visit posts_path
 end


 When /^I have added a post with title "(.*?)" and body "(.*?)" and thumbnail "(.*?)"$/ do |title, body, thumbnail|
  visit new_post_path
  fill_in 'Title', :with => title
  fill_in 'froala-editor', :with => body
  fill_in 'post_thumbnail', :with => thumbnail
  click_button 'Create Post'
 end

 Then /^I should see a post entry with title "(.*?)" and body "(.*?)" and thumbnail "(.*?)"$/ do |title, body, thumbnail|
   result=false
   all("div").each do |tr|
     if tr.has_content?(title) && tr.has_content?(body) && tr.has_content?(thumbnail)
       result = true
       break
     end
   end  
  expect(result).to be_truthy
 end


 When /^I have edited the post "(.*?)" to change the thumbnail to "(.*?)"$/ do |post, thumbnail|
  click_on "Edit"
  fill_in 'post_thumbnail', :with => thumbnail
  click_button 'Update Post'
 end
 
  When /^I have visited the epanded page for the "(.*?)" post$/ do |title|
   visit posts_path
   click_on "More about #{title}"
 end
 
  Then /^(?:|I )should see "([^"]*)"$/ do |text|
    expect(page).to have_content(text)
 end
