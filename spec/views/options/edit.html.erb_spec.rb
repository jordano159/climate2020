require 'rails_helper'

RSpec.describe "options/edit", type: :view do
  before(:each) do
    @option = assign(:option, Option.create!(
      :title => "MyString",
      :consequense => "MyText",
      :event => nil,
      :min_resilience => 1,
      :min_budget => 1,
      :min_civ_num => 1,
      :min_reg_rel => 1,
      :min_agriculture => 1,
      :min_education => 1,
      :min_security => 1,
      :min_comms => 1,
      :min_social_sec => 1,
      :min_health => 1,
      :min_water => 1,
      :min_energy => 1
    ))
  end

  it "renders the edit option form" do
    render

    assert_select "form[action=?][method=?]", option_path(@option), "post" do

      assert_select "input[name=?]", "option[title]"

      assert_select "textarea[name=?]", "option[consequense]"

      assert_select "input[name=?]", "option[event_id]"

      assert_select "input[name=?]", "option[min_resilience]"

      assert_select "input[name=?]", "option[min_budget]"

      assert_select "input[name=?]", "option[min_civ_num]"

      assert_select "input[name=?]", "option[min_reg_rel]"

      assert_select "input[name=?]", "option[min_agriculture]"

      assert_select "input[name=?]", "option[min_education]"

      assert_select "input[name=?]", "option[min_security]"

      assert_select "input[name=?]", "option[min_comms]"

      assert_select "input[name=?]", "option[min_social_sec]"

      assert_select "input[name=?]", "option[min_health]"

      assert_select "input[name=?]", "option[min_water]"

      assert_select "input[name=?]", "option[min_energy]"
    end
  end
end
