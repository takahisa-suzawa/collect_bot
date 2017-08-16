require 'rails_helper'

RSpec.describe "infomations/index", type: :view do
  before(:each) do
    assign(:infomations, [
      Infomation.create!(
        :text => "MyText",
        :report => nil
      ),
      Infomation.create!(
        :text => "MyText",
        :report => nil
      )
    ])
  end

  it "renders a list of infomations" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
