require 'rails_helper'

RSpec.describe 'member_points/new', type: :view do
  before(:each) do
    assign(:member_point, MemberPoint.new(
                            points: 1
                          ))
  end

  it 'renders new member_point form' do
    render

    assert_select 'form[action=?][method=?]', member_points_path, 'post' do
      assert_select 'input[name=?]', 'member_point[points]'
    end
  end
end
