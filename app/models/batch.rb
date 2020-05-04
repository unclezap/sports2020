class Batch < ApplicationRecord
    has_one :article
    has_many :predictions, through: :article
    has_one :week_result
    has_many :scores, through: :week_result
    belongs_to :user

    def self.create_with_all(website, user, name="default name")
        @website = website
        @user = user
        @name = name
        @batch = Batch.create(name: @name, user_id: @user.id)

        @article = Article.create_with_text(@website, @batch.id)

        @date = Scraper.find_publish_date(@article.article_text)

        @nfl_week = GamedayPredictor.predict_nfl(@date)

        if @name == ""
            @batch.name = "Week #{@nfl_week[0]}, #{@nfl_week[1]}"
            @batch.save
        end

        @week_result = WeekResult.create_with_scores(@nfl_week[0], @nfl_week[1], @nfl_week[2], @batch.id)

        @batch
    end
end