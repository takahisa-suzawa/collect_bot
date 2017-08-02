require 'rails_helper'

RSpec.describe Api::V1::WebhookController, type: :controller do
  describe "POST /api/v1/webhooks" do
    before do
      @params = FactoryGirl.attributes_for(:webhook)
    end
    
    it '200が返ってくる' do
      p @params
      post api_v1_webhooks_path, params: @params
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'webhookレコードが1増える' do
      expect { post api_v1_webhooks_path, @params }.to change(Webhook, :count).by(1)
    end
  end
end
