require 'rails_helper'

RSpec.describe "bios/show", type: :view do
  before(:each) do
    @bio = assign(:bio, Bio.create!(
      body: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
