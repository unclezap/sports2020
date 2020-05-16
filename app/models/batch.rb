class Batch < ApplicationRecord
    has_one :article
    has_many :predictions, through: :article
    has_one :week_result
    has_many :scores, through: :week_result
    belongs_to :user

    def self.create_with_all(website, user)
        @website = website
        @user = user

        @batch = Batch.create(user_id: @user.id)
        @article = Article.create_with_text(@website, @batch.id)

        @date = Scraper.find_publish_date(@article.article_text)

        @nfl_week = GamedayPredictor.predict_nfl(@date)

        @batch.name = "Week #{@nfl_week[0]}, #{@nfl_week[1]}, #{@nfl_week[2].capitalize} Season"
        @batch.save

        @week_result = WeekResult.create_with_scores(@nfl_week[0], @nfl_week[1], @nfl_week[2], @batch.id)

        @batch
    end

    def self.create_all_weeks_for_new_user(user)
        @user = user
            if Batch.all.length < 18
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/27155205/week-1-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/27593208/week-2-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/27646341/week-3-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/27691599/week-4-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/27752831/week-5-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/27807791/week-6-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/27860778/week-7-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/27911398/week-8-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/27966856/week-9-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/28020375/week-10-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/28072584/week-11-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/28123424/week-12-nfl-game-picks-schedule-guide-fantasy-football-tips-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/28175851/week-13-nfl-game-picks-schedule-guide-playoff-scenarios-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/28224405/week-14-nfl-game-picks-schedule-guide-playoff-scenarios-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/28277543/week-15-nfl-game-picks-schedule-guide-playoff-scenarios-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/28328575/week-16-nfl-game-picks-schedule-guide-playoff-scenarios-more', @user)
                Batch.create_with_all('https://www.espn.com/nfl/story/_/id/28366043/week-17-nfl-game-picks-schedule-guide-playoff-scenarios-more', @user)
            end
    end
end