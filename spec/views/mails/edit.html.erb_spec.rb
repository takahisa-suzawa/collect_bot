require 'rails_helper'

RSpec.describe "mails/edit", type: :view do
  before(:each) do
    @mail = assign(:mail, Mail.create!(
      :title => "MyString",
      :report => nil
    ))
  end

  it "renders the edit mail form" do
    render

    assert_select "form[action=?][method=?]", mail_path(@mail), "post" do

      assert_select "input[name=?]", "mail[title]"

      assert_select "input[name=?]", "mail[report_id]"
    end
  end
end
