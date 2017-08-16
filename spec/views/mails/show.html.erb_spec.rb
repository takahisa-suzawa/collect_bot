require 'rails_helper'

RSpec.describe "mails/show", type: :view do
  before(:each) do
    @mail = assign(:mail, Mail.create!(
      :title => "Title",
      :report => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
  end
end
