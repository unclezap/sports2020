require 'httparty'
require 'nokogiri'
  
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
        text = text.to_s
        pick_start = text.index("pick:</strong>")
        pick_space_start = text.index("pick: </strong>")
        space_anomaly = false
        if !!pick_space_start
            if !pick_start
                pick_start = pick_space_start
            else
                if pick_space_start < pick_start
                    pick_start = pick_space_start
                    space_anomaly = true
                end
            end
        end
        if pick_start != nil
            chunk = text.slice(pick_start, 80)
            if space_anomaly
                team_a_start = chunk.index('>') +1
            else
                team_a_start = chunk.index(' ') + 1
            end
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
            text = text.slice(pick_start+team_b_start+team_b_score_end..text.length)
            Scraper.find_predictions(text, results_array)
        end
        results_array
    end

    def self.find_score(text, team)
        text = text.to_s
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

    def self.find_publish_date(text)
        date_start = text.index("datePublished")
        date = text.slice(date_start+16,10).to_date
        date
    end
end