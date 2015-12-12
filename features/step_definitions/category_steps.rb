Given(/^there exists "(.*?)" category$/) do |arg1|
  Category.create!(name: arg1, thumbnail: "tbn.jpg", description: 'desc')
end

When(/^I view the category index$/) do
  visit categories_path
end

When(/^I should see "(.*?)" in category index$/) do |arg1|
  result = /#{arg1}/ =~ page.body
  expect(result).to be_truthy
end