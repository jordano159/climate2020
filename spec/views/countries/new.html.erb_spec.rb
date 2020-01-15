require 'rails_helper'

RSpec.describe "countries/new", type: :view do
  before(:each) do
    assign(:country, Country.new(
      :resilience => "",
      :init_civ => "",
      :civ_num => "",
      :deg => 1.5,
      :life_level => "",
      :score => "",
      :year => "",
      :reg_rel => "",
      :is_conquered => false,
      :agriculture => "",
      :education => "",
      :security => "",
      :comms => "",
      :social_sec => "",
      :health => "",
      :water => "",
      :energy => ""
    ))
  end

  it "renders new country form" do
    render

    assert_select "form[action=?][method=?]", countries_path, "post" do

      assert_select "input[name=?]", "country[resilience]"

      assert_select "input[name=?]", "country[init_civ]"

      assert_select "input[name=?]", "country[civ_num]"

      assert_select "input[name=?]", "country[deg]"

      assert_select "input[name=?]", "country[life_level]"

      assert_select "input[name=?]", "country[score]"

      assert_select "input[name=?]", "country[year]"

      assert_select "input[name=?]", "country[reg_rel]"

      assert_select "input[name=?]", "country[is_conquered]"

      assert_select "input[name=?]", "country[agriculture]"

      assert_select "input[name=?]", "country[education]"

      assert_select "input[name=?]", "country[security]"

      assert_select "input[name=?]", "country[comms]"

      assert_select "input[name=?]", "country[social_sec]"

      assert_select "input[name=?]", "country[health]"

      assert_select "input[name=?]", "country[water]"

      assert_select "input[name=?]", "country[energy]"
    end
  end
end
