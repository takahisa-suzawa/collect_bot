require 'rails_helper'

RSpec.describe "infomations/edit", type: :view do
  before(:each) do
    @infomation = assign(:infomation, Infomation.create!(
      :text => "MyText",
      :report => nil
    ))
  end

  it "renders the edit infomation form" do
    render

    assert_select "form[action=?][method=?]", infomation_path(@infomation), "post" do

      assert_select "textarea[name=?]", "infomation[text]"

      assert_select "input[name=?]", "infomation[report_id]"
    end
  end
end
