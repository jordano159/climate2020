require 'rails_helper'

RSpec.describe "countries/show", type: :view do
  before(:each) do
    @country = assign(:country, Country.create!(
      :resilience => "",
      :init_civ => "",
      :civ_num => "",
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
