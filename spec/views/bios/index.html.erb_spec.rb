require 'rails_helper'

RSpec.describe "bios/index", type: :view do
  before(:each) do
    assign(:bios, [
      Bio.create!(
        body: "MyText"
      ),
      Bio.create!(
        body: "MyText"
      )
    ])
  end

  it "renders a list of bios" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
