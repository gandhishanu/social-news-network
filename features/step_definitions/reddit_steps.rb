Given(/^there are (\d+) posts with (\d+) upvotes and (\d+) downvotes each created on different dates$/) do |post_count, up_count, down_count|
  time = Time.parse('2015-12-09 00:00:00')
  (1..post_count.to_i).each do |p|
    Post.create!({id: p, title: "Post #{p}", body: "body", thumbnail: 'tn.jpg', category_id:1, created_at: time + p*10})
  end
  (1..up_count.to_i).each do |u|
    User.create!({id: u, name: 'name', email: "email#{u}@email.com", password:'password'})
  end
  (1..post_count.to_i).each do |p|
    (1..up_count.to_i).each do |u|
      Vote.create!({updown_cd: 0, user_id: u, post_id: p})
    end
  end
end

Then(/^I should see newest posts first$/) do
  posts = Post.order('created_at DESC').all
  titles = posts.map{|p| p.title}.join(".*")
  result = /#{titles}/m =~ page.body
  expect(result).to be_truthy
end

Given(/^there are (\d+) posts created on same date but different number of upvotes$/) do |post_count|
  time = Time.parse('2015-12-09 00:00:00')
  (1..post_count.to_i).each do |p|
    Post.create!({id: p, title: "Post #{p}", body: "body", thumbnail: 'tn.jpg', category_id:1, created_at: time})
  end
  (1..post_count.to_i).each do |u|
    User.create!({id: u, name: 'name', email: "email#{u}@email.com", password:'password'})
  end
  (1..post_count.to_i).each do |p|
    (1..p).each do |u|
      Vote.create!({updown_cd: 0, user_id: u, post_id: p})
    end
  end
end

Then(/^I should see posts with most up votes first$/) do
  posts = (1..Post.count).map{|p| "Post #{p}"}.reverse
  titles = posts.join(".*")
  result = /#{titles}/m =~ page.body
  expect(result).to be_truthy
end