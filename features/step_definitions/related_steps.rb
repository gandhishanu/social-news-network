Given(/^a user liked "(.*?)" and "(.*?)"$/) do |postA, postB|
  User.create!({id: 1, name: 'name', email: "email@email.com", password:'password'})
  Post.create!({id: 1, title: postA, body: "body", thumbnail: 'tn.jpg', category_id:1})
  Post.create!({id: 2, title: postB, body: "body", thumbnail: 'tn.jpg', category_id:1})
  Vote.create!({updown_cd: 0, user_id: 1, post_id: 1})
  Vote.create!({updown_cd: 0, user_id: 1, post_id: 2})
  Related.update_relations
end

When(/^I am viewing "(.*?)"$/) do |post|
  post = Post.find_by_title(post)
  visit post_url(id: post.id)
end

Then(/^I should see "(.*?)" as related$/) do |post|
  result = /#{post}/m =~ page.body
  expect(result).to be_truthy
end

Given(/^"(.*?)", "(.*?)" and "(.*?)" are registered$/) do |userA, userB, userC|
  User.create!({id: 1, name: userA, email: "email1@email.com", password:'password'})
  User.create!({id: 2, name: userB, email: "email1@email.com", password:'password'})
  User.create!({id: 3, name: userC, email: "email1@email.com", password:'password'})
end

Given(/^posts "(.*?)", "(.*?)" and "(.*?)" exist$/) do |postA, postB, postC|
  Post.create!({id: 1, title: postA, body: "body", thumbnail: 'tn.jpg', category_id:1})
  Post.create!({id: 2, title: postB, body: "body", thumbnail: 'tn.jpg', category_id:1})
  Post.create!({id: 3, title: postC, body: "body", thumbnail: 'tn.jpg', category_id:1})
end

Given(/^"(.*?)" up voted "(.*?)" and "(.*?)"$/) do |user, post1, post2|
  user = User.find_by_name(user)
  post1 = Post.find_by_title(post1)
  post2 = Post.find_by_title(post2)

end

Then(/^I should see "(.*?)" before "(.*?)" as related in related section$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end