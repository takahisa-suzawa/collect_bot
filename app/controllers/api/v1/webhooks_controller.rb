require 'open-uri'
require 'nokogiri'
require 'RMagick'

module Api
  module V1
    class WebhooksController < ApplicationController
      def index
        response = {'text' => "bad request!! The get method is not supported."}
        render json: response
      end

      # POST api/v1/webhooks
      def create
        logger.info params
        @webhook = Webhook.new(webhook_params)
        
        if @webhook.save
          response = {'text' => "I registered."}
        else
          response = {'text' => "An error occurred."}
          render json: response and return
        end

        # webhookの命令を実行する
        order = @webhook.text.delete(@webhook.trigger_word).split(" ")
        logger.info order
        if 'help' == order[0]
          response = {'text' => "#{@webhook.trigger_word} help ¥n #{@webhook.trigger_word} post <url> ¥n "}
        elsif 'post' == order[0]
          url = order[1].delete('<','>').chomp
          html = parse_html url
          if html.present?
            # タイトルを表示
            title = html.title
 
            thumbnail = parse_thumbnail(html)
            if thumbnail.nil?
              thumbnail = 'secury_log.jpg'
            end
            report = Report.find_accepting_report @webhook.timestamp
            if report.nil?
              report = Report.new(:accepted_date => @webhook.timestamp)
              Report.transaction do
                report.save!
              end
            end

            @article = report.articles.build(:post_date => @webhook.timestamp, :url => url, :title => title, :image => thumbnail, :report_id => report.id)
            if @article.save
              response = {'text' => "I registered #{title}"}
            else
              logger.error　@article.errors
              response = {'text' => "sorry! Registration failed!"}
            end
          else
            response = {'text' => "not url #{url}"}
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
          return Nokogiri::HTML.parse(html, nil, charset)
        rescue => e
          logger.error e
          return nil
        end
      end

      def parse_thumbnail(html)
        #imgタグだけ取得
        images = html.css('img')
        # 100 x 100pxの画像があるかチェック
        if images.present?
          # Check the size with RMagick
          url = nil
          images.each do |image|
            url = image.attributes["src"].value
            begin
              rm_image = Magick::ImageList.new(url)
              if rm_image.columns >= 100 && rm_image.rows >= 100  
                break
              end
            rescue => e
              logger.warn e
            end 
          end
          return url
        end
      end

    end
  end
end