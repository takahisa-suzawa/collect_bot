require "#{Rails.root}/app/controllers/application_controller.rb"

module Api
  module V1
    class WebhooksController < ApplicationController
      def index
        response = {'text' => "bad request!! The get method is not supported."}
        render json: response
      end

      # POST api/v1/webhooks
      def create
        logger.debug '@@@@@@@@@@@@@@@@@@@@@@@@@@'
        logger.debug params
        @webhook = webhook.new(webhook_params)
        respond_to do |format|
          if @webhook.save
            response = {'text' => "I registered."}
            format.json response
          else
            response = {'text' => "An error occurred."}
            format.json response
          end
        end
      end

      private
        # Never trust parameters from the scary internet, only allow the white list through.
        def webhook_params
          params.require(:webhook).permit(:token, :team_id, :team_domain, :channel_id, :channel_name, :timestamp, :user_id, :user_name, :text, :trigger_word)
        end
      end
    end
  end
end