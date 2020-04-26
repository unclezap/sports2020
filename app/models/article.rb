class Article < ApplicationRecord

    def self.create_with_text(website)
        @website = website
        @html = Scraper.scrape(@website)
        Article.create(article_text: @html, article_url: @website)
    end
end
