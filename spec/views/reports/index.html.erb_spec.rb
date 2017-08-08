require 'rails_helper'

RSpec.describe "reports/index", type: :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        :infomation => "MyText"
      ),
      Report.create!(
        :infomation => "MyText"
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
