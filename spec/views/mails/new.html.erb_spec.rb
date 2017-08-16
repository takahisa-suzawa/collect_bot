require 'rails_helper'

RSpec.describe "mails/new", type: :view do
  before(:each) do
    assign(:mail, Mail.new(
      :title => "MyString",
      :report => nil
    ))
  end

  it "renders new mail form" do
    render

    assert_select "form[action=?][method=?]", mails_path, "post" do

      assert_select "input[name=?]", "mail[title]"

      assert_select "input[name=?]", "mail[report_id]"
    end
  end
end
