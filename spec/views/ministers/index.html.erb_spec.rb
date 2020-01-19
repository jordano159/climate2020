require 'rails_helper'

RSpec.describe "ministers/index", type: :view do
  before(:each) do
    assign(:ministers, [
      Minister.create!(
        :role => "Role",
        :description => "MyText"
      ),
      Minister.create!(
        :role => "Role",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of ministers" do
    render
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
