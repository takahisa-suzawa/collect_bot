require 'rails_helper'

RSpec.describe "Mails", type: :request do
  describe "GET /mails" do
    it "works! (now write some real specs)" do
      get mails_path
      expect(response).to have_http_status(200)
    end
  end
end
