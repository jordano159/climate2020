require 'rails_helper'

RSpec.describe "ministers/show", type: :view do
  before(:each) do
    @minister = assign(:minister, Minister.create!(
      :role => "Role",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/MyText/)
  end
end
