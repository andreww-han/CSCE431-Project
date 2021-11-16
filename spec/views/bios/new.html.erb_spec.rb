require 'rails_helper'

RSpec.describe 'bios/new', type: :view do
  before(:each) do
    assign(:bio, Bio.new(
                   body: 'MyText'
                 ))
  end

  it 'renders new bio form' do
    render

    assert_select 'form[action=?][method=?]', bios_path, 'post' do
      assert_select 'textarea[name=?]', 'bio[body]'
    end
  end
end
