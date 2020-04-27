class ArticlesController < ApplicationController

    def index
        articles = Article.all
        render json: articles
    end

    def show
        article = Article.find_by(id: params[:id])
        render json: article.predictions
        # predictions_text = Article.find_by(id: params[:id]).article_text
        # picks = Scraper.find_predictions(predictions_text)

        # scores_text = Article.find_by(id: 178).article_text
        # scores = Scraper.find_all_scores_nfl(scores_text)

        # return_hash = {}
        # return_hash[:picks] = picks
        # return_hash[:scores] = scores
        # render json: return_hash
    end

    private

    def whatdoesitsay
        params.require(:article).permit(:article_text, :article_url)
    end

end
