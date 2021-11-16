require 'rails_helper'

RSpec.describe 'activities/new', type: :view do
  before(:each) do
    assign(:activity, Activity.new(
                        name: 'MyString',
                        num_points: 1
                      ))
  end

  it 'renders new activity form' do
    render

    assert_select 'form[action=?][method=?]', activities_path, 'post' do
      assert_select 'input[name=?]', 'activity[name]'

      assert_select 'input[name=?]', 'activity[num_points]'
    end
  end
end
