# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.delete_all

test = Article.create(article_text: "Hi!", article_url: "https://www.google.com")

espn1 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/27155205/week-1-nfl-game-picks-schedule-guide-fantasy-football-tips-more')

the_ringer1 = Article.create_with_text('https://www.theringer.com/nfl/2019/11/27/20985140/week-13-preview-ravens-49ers')