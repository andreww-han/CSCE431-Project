require 'rails_helper'

RSpec.describe 'member_points/show', type: :view do
  before(:each) do
    @member_point = assign(:member_point, MemberPoint.create!(
                                            points: 2
                                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2/)
  end
end
