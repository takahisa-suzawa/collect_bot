require 'open-uri'
require 'nokogiri'

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
        order = @webhook.text.delete(@webhook.trigger_word).split(" ")

        if 'help' == order[0]
          response = {'text' => "#{@webhook.trigger_word} help ¥n #{@webhook.trigger_word} post <url> ¥n "}
        elsif 'post' == order[0]
          url = parse_html order[1].delete('<','>').chomp
          p url
          html = parse_html url
          if html.present?
            # タイトルを表示
            title = html.title

            @article = Article.new(:postedDate => @webhook.timestamp, :url => url, :title => title)
            if @article.save
              response = {'text' => "I registered #{title}"}
            else
              logger.error　@article.errors
              response = {'text' => "sorry! Registration failed!"}
            end
          else
            response = {'text' => "not url #{order[1]}"}
          end
        else
          response = {'text' => "sorry!! unsported command. help=> #{@webhook.trigger_word} help"}
        end
        render json: response
      end

      private
      def webhook_params
        params.permit(:token, :team_id, :team_domain, :channel_id, :channel_name, :timestamp, :user_id, :user_name, :text, :trigger_word)
      end

      def parse_html(url)
        charset = nil
        begin
          html = open(url) do |f|
            charset = f.charset # 文字種別を取得
            f.read # htmlを読み込んで変数htmlに渡す
          end

          # htmlをパース(解析)してオブジェクトを生成
          Nokogiri::HTML.parse(html, nil, charset)
        rescue
          return nil
        end
      end
    end
  end
end