require 'rails_helper'

RSpec.describe "advertisements/show", type: :view do
  before(:each) do
    @advertisement = assign(:advertisement, Advertisement.create!(
      :title => "Title",
      :content => "MyText",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
