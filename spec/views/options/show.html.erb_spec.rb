require 'rails_helper'

RSpec.describe "options/show", type: :view do
  before(:each) do
    @option = assign(:option, Option.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
  end
end
