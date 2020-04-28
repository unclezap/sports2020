class GamedayPredictor

    def self.predict_nfl(date)
        season = "reg"
        date = date.to_date
        year = date.year

        if date.month < 3
            year -= 1
        end
        
        leap_count = (year - 2012)/4.round()
        sept_start_date = 2021 - year - leap_count
        while sept_start_date < 7 do
            sept_start_date += 7
        end
        opening_day = "September #{sept_start_date}, #{year}".to_date
        
        while date.wday > 0 do
            date += 1
        end

        week = 1
        while opening_day < date
            opening_day += 7
            week += 1
        end

        if week > 17
            week -= 17
            season = "post"

            if week > 4
                week = 4
            end
        end

        week = week.to_s
        year = year.to_s

        return [week, year, season]
    end
end