require 'rails_helper'

RSpec.describe "options/index", type: :view do
  before(:each) do
    assign(:options, [
      Option.create!(
        :title => "Title",
        :consequense => "MyText",
        :event => nil,
        :min_resilience => 2,
        :min_budget => 3,
        :min_civ_num => 4,
        :min_reg_rel => 5,
        :min_agriculture => 6,
        :min_education => 7,
        :min_security => 8,
        :min_comms => 9,
        :min_social_sec => 10,
        :min_health => 11,
        :min_water => 12,
        :min_energy => 13
      ),
      Option.create!(
        :title => "Title",
        :consequense => "MyText",
        :event => nil,
        :min_resilience => 2,
        :min_budget => 3,
        :min_civ_num => 4,
        :min_reg_rel => 5,
        :min_agriculture => 6,
        :min_education => 7,
        :min_security => 8,
        :min_comms => 9,
        :min_social_sec => 10,
        :min_health => 11,
        :min_water => 12,
        :min_energy => 13
      )
    ])
  end

  it "renders a list of options" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
  end
end
