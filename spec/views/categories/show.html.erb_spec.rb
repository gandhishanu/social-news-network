require 'rails_helper'

RSpec.describe "categories/show", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
                                    :name => "MyString",
                                    :thumbnail => 'abc.jpg',
                                    :description => 'this is a desciption'
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
