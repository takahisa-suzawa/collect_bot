require 'rails_helper'

RSpec.describe "Webhooks", type: :request do
  describe "GET /api/v1/webhooks" do
    it "get" do
      get '/api/v1/webhooks'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/v1/webhooks helpが投稿されたパターン" do
    before do
      @params = FactoryGirl.attributes_for(:url_post)
    end
    
    it '200が返ってくる' do
      post '/api/v1/webhooks', params: @params
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'webhookレコードが1増える' do
      expect { post '/api/v1/webhooks', params: @params }.to change(Webhook, :count).by(1)
    end
  end

  describe "POST /api/v1/webhooks URLが投稿されたパターン" do
    before do
      @params = FactoryGirl.attributes_for(:url_post)
    end
    
    it '200が返ってくる' do
      post '/api/v1/webhooks', params: @params
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'webhookレコードが1増える' do
      expect { post '/api/v1/webhooks', params: @params }.to change(Webhook, :count).by(1)
    end
  end
end
