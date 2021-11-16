require 'rails_helper'

RSpec.describe 'member_points/edit', type: :view do
  before(:each) do
    @member_point = assign(:member_point, MemberPoint.create!(
                                            points: 1
                                          ))
  end

  it 'renders the edit member_point form' do
    render

    assert_select 'form[action=?][method=?]', member_point_path(@member_point), 'post' do
      assert_select 'input[name=?]', 'member_point[points]'
    end
  end
end
