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
            logger.debug "○○○○○○○○○○○○○○○#{trigger} #{text}️"
            if (text.match(/^(<http?|<ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)(>)$/)
                || text.match(/^(<https?|<ftp)(:\/\/[-_.!~*\'()a-zA-Z0-9;\/?:\@&=+\$,%#]+)(>)$/)) {
                
                text = text[0, text.index(/¥>/) + 1]
                @article = Article.new(:postedDate => timestamp, :title => trigger, :url => text)
            
                if @article.save
                    response = {'text' => "登録しました。->#{text}"}
                    render json: response
                else
                    logger.error　format.json { render json: @article.errors, status: :unprocessable_entity }
                    response = {'text' => "登録できませんでした。"}
                    render json: response
                end
            }
            
            
        rescue ActionRecord::RecordInvalid, ActionRecord::RecordNotSaved => ex
            format.json { render json: ex, status: :unprocessable_entity }
        end
    end

    

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_article
        @article = Article.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def article_params
        params.require(:article).permit(:url, :title, :postedDate, :content, :thumbnail)
        end
    end
end
