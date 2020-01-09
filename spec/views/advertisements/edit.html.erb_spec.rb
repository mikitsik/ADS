require 'rails_helper'

RSpec.describe "advertisements/edit", type: :view do
  before(:each) do
    @advertisement = assign(:advertisement, Advertisement.create!(
      :title => "MyString",
      :content => "MyText",
      :user => nil
    ))
  end

  it "renders the edit advertisement form" do
    render

    assert_select "form[action=?][method=?]", advertisement_path(@advertisement), "post" do

      assert_select "input[name=?]", "advertisement[title]"

      assert_select "textarea[name=?]", "advertisement[content]"

      assert_select "input[name=?]", "advertisement[user_id]"
    end
  end
end
