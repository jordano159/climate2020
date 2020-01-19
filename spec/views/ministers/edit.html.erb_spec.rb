require 'rails_helper'

RSpec.describe "ministers/edit", type: :view do
  before(:each) do
    @minister = assign(:minister, Minister.create!(
      :role => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit minister form" do
    render

    assert_select "form[action=?][method=?]", minister_path(@minister), "post" do

      assert_select "input[name=?]", "minister[role]"

      assert_select "textarea[name=?]", "minister[description]"
    end
  end
end
