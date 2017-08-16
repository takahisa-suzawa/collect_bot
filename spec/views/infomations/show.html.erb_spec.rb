require 'rails_helper'

RSpec.describe "infomations/show", type: :view do
  before(:each) do
    @infomation = assign(:infomation, Infomation.create!(
      :text => "MyText",
      :report => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
