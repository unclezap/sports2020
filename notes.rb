https://www.espn.com/nfl/story/_/id/27155205/week-1-nfl-game-picks-schedule-guide-fantasy-football-tips-more

https://www.espn.com/nfl/story/_/id/28175851/week-13-nfl-game-picks-schedule-guide-playoff-scenarios-more

https://www.theringer.com/nfl/2019/11/27/20985140/week-13-preview-ravens-49ers


def self.find_scores(html)
    array = []
    
    index = 0
    while index < html.length do
        if html[index] == "p"
            team_name_start = 1
            while html[index+team_name_start] != ">"
                team_name_start += 1
            end
            team_name_start +=1
            team_name_end = team_name_start
            #new whiles that look for a space, then a comma, then a space, then a space
            while html[index+team_name_end] != "<"
                team_name_end += 1
            end
            team_name_end_index = index + team_name_end - 1
            team_name_start_index = index + team_name_start
            array.push(html.slice(team_name_start_index..team_name_end_index))
        end
        index += 1
        puts index
    end
    puts "new"
    array
end



def self.clock_methods(html)
    @html = html

    manual_time = Time.now
    Scraper.find_scores_manual(@html)
    manual_total_time = (Time.now - manual_time)

    index_time = Time.now
    Scraper.find_scores_by_index(@html)
    index_total_time = (Time.now - index_time)

    puts "============"
    puts "============"

    puts "manual search method:"
    puts "#{manual_total_time} sec"

    puts "indices method:"
    puts "#{index_total_time} sec"
end

def self.find_scores_manual(html)
    index = 0
    picks_indices = []
    while index < html.length do
        if html[index] == "p"
            if html[index+1] == "i"
                if html[index+2] == "c"
                    if html[index+3] == "k"
                        if html[index+4] == ":"
                            picks_indices.push(index)
                        end
                    end
                end
            end
        end
        index += 1
    end
    
    new_index = 0
    results_array = []
    while new_index < picks_indices.length do
        results_array.push(html.slice(picks_indices[new_index],40))
        new_index += 1
    end
    results_array
end

https://www.espn.com/nfl/story/_/id/28576384/super-bowl-liv-score-predictions-espn-experts-pick-49ers-chiefs