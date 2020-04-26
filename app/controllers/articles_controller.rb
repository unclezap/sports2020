class ArticlesController < ApplicationController

    def index
        articles = Article.all
        # text = articles.map {|article| article.article_text}
        # byebug
        render json: articles
    end

    def show
        story_text = Article.find_by(id: params[:id]).article_text
        picks = Scraper.find_scores(story_text)
        render json: picks
    end

    private

    def whatdoesitsay
        params.require(:article).permit(:article_text, :article_url)
    end

end
