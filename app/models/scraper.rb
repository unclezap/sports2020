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


    def self.find_scores(html, results_array=[])
        pick_start = html.index("pick:")
        if pick_start != nil
            results_array.push(html.slice(pick_start,40))
            html = html.slice(pick_start+40..html.length)
            Scraper.find_scores(html, results_array)
        end
        results_array
    end


end