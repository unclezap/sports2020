require 'httparty'
require 'nokogiri'
require 'pry'
  
class Scraper

    def self.parse_url(website)
        unparsed_page = HTTParty.get(website)
        Nokogiri::HTML(unparsed_page)
    end

    def self.scrape(website)
        @website = website
        parsed_page = self.parse_url(@website)
    end

    def self.find_predictions(text, results_array=[])
        # binding.pry
        text = text.to_s
        # binding.pry
        pick_start = text.index("pick:</strong>")
        # binding.pry
        if pick_start != nil
            chunk = text.slice(pick_start, 40)
            team_a_start = chunk.index(' ') + 1
            team_a_end = chunk.index(',') - 4
            team_a_score_start = chunk.index(',') - 2
            team_b_start = chunk.index(',') + 2
            chunk2 = chunk.slice(team_b_start..chunk.length)
            team_b_end = chunk2.index(' ') - 1
            team_b_score_start = chunk2.index(' ') + 1
            team_b_score_end = chunk2.index('<') - 1
            hash = {}
            team_a = chunk.slice(team_a_start..team_a_end)
            team_b = chunk2.slice(0..team_b_end)

            hash[team_a] = chunk.slice(team_a_score_start, 2).gsub(/ /,'').to_i
            hash[team_b] = chunk2.slice(team_b_score_start..team_b_score_end).to_i

            results_array.push(hash)
            text = text.slice(pick_start+40..text.length)
            Scraper.find_predictions(text, results_array)
        end
        results_array
    end

    def self.find_score(text, team)
        pick_start = text.index("title=\"#{team}")
        if pick_start !=nil
            score_string = (text.slice(pick_start, 200))
            score_index = score_string.index("</b></td>")
            score = (score_string.slice(score_index - 2, 2))
            return score.gsub(/\>/,'')            
        else
            return "bye week"
        end
    end

    def self.find_all_scores_nfl(text)
        teams_array = [
            "Arizona",
            "Atlanta",
            "Baltimore",
            "Buffalo",
            "Carolina",
            "Chicago",
            "Cincinnati",
            "Cleveland",
            "Dallas",
            "Denver",
            "Detroit",
            "Green Bay",
            "Houston",
            "Indianapolis",
            "Jacksonville",
            "Kansas City",
            "Los Angeles Chargers",
            "Los Angeles Rams",
            "Miami",
            "Minnesota",
            "New England",
            "New Orleans",
            "New York Giants",
            "New York Jets",
            "Oakland",
            "Philadelphia",
            "Pittsburgh",
            "San Francisco",
            "Seattle",
            "Tampa Bay",
            "Tennessee",
            "Washington"
        ]
        i = 0
        results_hash = {}
        32.times do
            results_hash[teams_array[i]] = Scraper.find_score(text, teams_array[i]).to_i 
            i += 1 
        end
        results_hash
    end
end