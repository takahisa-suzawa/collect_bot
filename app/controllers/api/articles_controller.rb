require 'open-uri'
require 'nokogiri'

module Api
    class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    # GET /articles
    # GET /articles.json
    def index
        @articles = Article.all
        render json: @articles
    end

    # GET /articles/1
    # GET /articles/1.json
    def show
        render json: @article
    end

    # GET /articles/new
    #def new
    #  @article = Article.new
    #end

    # GET /articles/1/edit
    #def edit
    #end

    # POST /articles
    # POST /articles.json
    def create
        trigger = params[:trigger_word]
        text = params[:text]
        timestamp = params[:timestamp]

        
        begin
            logger.debug "○○○○○○○○○○○○○○○#{trigger} #{text}"
            url = ""
            if text =~ /^(<)(http?|<ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)(>)$/
                url = $2 + $3
            end 
            if url.nil? && text =~ /^(<)(https?|<ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)(>)$/
                url = $2 + $3
            end 
            
            if url.present?
                logger.debug "url #{url}"
                charset = nil
                html = open(url) do |f|
                    charset = f.charset
                    f.read
                end
                
                doc = Nokogiri::HTML.parse(html, nil, charset)

                # タイトルを表示
                title = doc.title

                @article = Article.new(:post_date => timestamp, :title => trigger, :url => text, :title => title)
            
                if @article.save
                    response = {'text' => "I registered .->#{title}"}
                    render json: response
                else
                    logger.error　@article.errors
                    response = {'text' => "sorry! Registration failed!"}
                    render json: response
                end
            end
        rescue => ex
            logger.fatal　ex
            render json: ex
        end
    end

    

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_article
        @article = Article.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def article_params
        params.require(:article).permit(:url, :title, :post_date, :content, :image)
        end
    end
end
