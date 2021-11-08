require 'rails_helper'

RSpec.describe "bios/edit", type: :view do
  before(:each) do
    @bio = assign(:bio, Bio.create!(
      body: "MyText"
    ))
  end

  it "renders the edit bio form" do
    render

    assert_select "form[action=?][method=?]", bio_path(@bio), "post" do

      assert_select "textarea[name=?]", "bio[body]"
    end
  end
end
