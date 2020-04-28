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
    
    def create
        batch = Batch.create_with_all(params[:article])
        predictions = batch.predictions
        scores = batch.scores
        hash = {}
        hash[:batch] = batch
        hash[:predictions] = predictions
        hash[:scores] = scores
        render json: hash
    end

    # private

    # def saywhat
    #     params.require(:article).permit(:article, :submitted, :controller, :action, :article_text, :article_url)
    # end

end
