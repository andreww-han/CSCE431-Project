require 'rails_helper'

RSpec.describe 'activities/index', type: :view do
  before(:each) do
    assign(:activities, [
             Activity.create!(
               name: 'Name',
               num_points: 2
             ),
             Activity.create!(
               name: 'Name',
               num_points: 2
             )
           ])
  end

  it 'renders a list of activities' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
