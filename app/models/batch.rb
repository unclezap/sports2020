class Batch < ApplicationRecord
    has_many :articles
    has_many :predictions, through: :articles
    has_many :week_results
    has_many :scores, through: :week_results
    belongs_to :user

    def self.create_with_all(website, user)
        @website = website
        @user = user

        @batch = Batch.create(name: "default - add a name field to the form", user_id: @user.id)

        @article = Article.create_with_text(@website, @batch.id)

        @date = Scraper.find_publish_date(@article.article_text)

        @nfl_week = GamedayPredictor.predict_nfl(@date)

        @week_result = WeekResult.create_with_scores(@nfl_week[0], @nfl_week[1], @nfl_week[2], @batch.id)

        @batch
    end
end