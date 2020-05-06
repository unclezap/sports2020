class ArticlesController < ApplicationController

    # def index
    #     articles = Article.all
    #     render json: articles
    # end

    # def show
    #     article = Article.find_by(id: params[:id])
    #     render json: article.predictions
    #     # predictions_text = Article.find_by(id: params[:id]).article_text
    #     # picks = Scraper.find_predictions(predictions_text)

    #     # scores_text = Article.find_by(id: 178).article_text
    #     # scores = Scraper.find_all_scores_nfl(scores_text)

    #     # return_hash = {}
    #     # return_hash[:picks] = picks
    #     # return_hash[:scores] = scores
    #     # render json: return_hash
    # end
    
    def create
        old_article = current_user.articles.find_by(article_url: params[:article])
        # prevents the making of a new article every time someone looks at an old analysis
        if !old_article
            batch = Batch.create_with_all(params[:article], current_user)
        else
            batch = old_article.batch
        end
        # adding join tables to batches could make it so the backend doesn't make a new article if someone else has already made it
        predictions = batch.predictions
        scores = batch.scores

        return_array = []
        hash = {}
        hash[:id] = batch.id
        hash[:name] = batch.name
        hash[:week] = batch.week_result.week
        hash[:predictions] = predictions
        hash[:scores] = scores
        return_array.push(hash)
 
        render json: return_array
    end

    #comment
    # private

    # def saywhat
    #     params.require(:article).permit(:article, :submitted, :controller, :action, :article_text, :article_url)
    # end

end
