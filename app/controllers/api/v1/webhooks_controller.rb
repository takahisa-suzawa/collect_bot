module Api
  module V1
    class WebhooksController < ApplicationController
      def index
        response = {'text' => "bad request!! The get method is not supported."}
        render json: response
      end

      # POST api/v1/webhooks
      def create
        @webhook = Webhook.new(webhook_params)
        
        if @webhook.save
          response = {'text' => "I registered."}
        else
          response = {'text' => "An error occurred."}
          render json: response and return
        end

        # webhookの命令を実行する
        # @セキュリから始まっているか ＜未実装＞

        # URLから始まっているか
        url = slice_url @webhook.text

        # それ以外はスルーする
        render json: response
      end

      private
      def webhook_params
        params.permit(:token, :team_id, :team_domain, :channel_id, :channel_name, :timestamp, :user_id, :user_name, :text, :trigger_word)
      end
      
      def 

      def slice_url(url)
        url = nil
        if text =~ /^(<http?|<ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)(>)$/
            url = $1 + $2 + $3
        end 
        if url.nil? && text =~ /^(<https?|<ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)(>)$/
            url = $1 + $2 + $3
        end
        return url
      end
    end
  end
end