require 'rails_helper'

RSpec.describe "mails/index", type: :view do
  before(:each) do
    assign(:mails, [
      Mail.create!(
        :title => "Title",
        :report => nil
      ),
      Mail.create!(
        :title => "Title",
        :report => nil
      )
    ])
  end

  it "renders a list of mails" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
