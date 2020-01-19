require 'rails_helper'

RSpec.describe "ministers/new", type: :view do
  before(:each) do
    assign(:minister, Minister.new(
      :role => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new minister form" do
    render

    assert_select "form[action=?][method=?]", ministers_path, "post" do

      assert_select "input[name=?]", "minister[role]"

      assert_select "textarea[name=?]", "minister[description]"
    end
  end
end
