require 'rails_helper'

RSpec.describe "member_points/index", type: :view do
  before(:each) do
    assign(:member_points, [
      MemberPoint.create!(
        points: 2
      ),
      MemberPoint.create!(
        points: 2
      )
    ])
  end

  it "renders a list of member_points" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
