require 'rails_helper'

RSpec.describe "goals/index", type: :view do
  before(:each) do
    assign(:goals, [
      Goal.create!(
        :description => "MyText"
      ),
      Goal.create!(
        :description => "MyText"
      )
    ])
  end

  it "renders a list of goals" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
