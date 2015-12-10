require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
          :name => "MyString1",
          :thumbnail => 'abc.jpg',
          :description => 'this is a desciption'
      ),
      Category.create!(
          :name => "MyString2",
          :thumbnail => 'abc.jpg',
          :description => 'this is a desciption'
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "div.caption>h3", :count => 2
  end
end
