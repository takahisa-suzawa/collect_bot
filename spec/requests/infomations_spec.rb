require 'rails_helper'

RSpec.describe "Infomations", type: :request do
  describe "GET /infomations" do
    it "works! (now write some real specs)" do
      get infomations_path
      expect(response).to have_http_status(200)
    end
  end
end
