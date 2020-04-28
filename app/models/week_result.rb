class WeekResult < ApplicationRecord
    belongs_to :batch
    has_many :scores

    def self.create_with_day(week, year, season, id)
        @week = week
        @id = id

        @website = "https://www.footballdb.com/scores/index.html?lg=NFL&yr=#{year}&type=#{season}&wk=#{week}"
        @text = Scraper.scrape(@website)
        
        @week_result = Week_result.create(results_text: @text, results_url: @website, week: @week, batch_id: @id)

        all_scores_hash = Scraper.find_all_scores_nfl(@text)
        all_teams = all_scores_hash.keys
        all_teams.each do |franchise|
            Score.create(team: franchise, points: all_scores_hash[franchise], week_result_id: @week_result.id)
        end
        
        @week_result
    end
end
