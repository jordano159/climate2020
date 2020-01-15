require 'rails_helper'

RSpec.describe "countries/index", type: :view do
  before(:each) do
    assign(:countries, [
      Country.create!(
        :name => "",
        :resilience => "",
        :init_civ => 2.5,
        :civ_num => 2.5,
        :deg => 2.5,
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
      ),
      Country.create!(
        :name => "",
        :resilience => "",
        :init_civ => 2.5,
        :civ_num => 2.5,
        :deg => 2.5,
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
      )
    ])
  end

  it "renders a list of countries" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
