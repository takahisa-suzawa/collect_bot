require 'rails_helper'

RSpec.describe "infomations/new", type: :view do
  before(:each) do
    assign(:infomation, Infomation.new(
      :text => "MyText",
      :report => nil
    ))
  end

  it "renders new infomation form" do
    render

    assert_select "form[action=?][method=?]", infomations_path, "post" do

      assert_select "textarea[name=?]", "infomation[text]"

      assert_select "input[name=?]", "infomation[report_id]"
    end
  end
end
