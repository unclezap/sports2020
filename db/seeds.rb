# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.delete_all

Article.create(article_text: "start db", article_url: "hi!")

espn1 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/27155205/week-1-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn2 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/27593208/week-2-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn3 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/27646341/week-3-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn4 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/27691599/week-4-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn5 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/27752831/week-5-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn6 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/27807791/week-6-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn7 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/27860778/week-7-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn8 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/27911398/week-8-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn9 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/27966856/week-9-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn10 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/28020375/week-10-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn11 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/28072584/week-11-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn12 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/28123424/week-12-nfl-game-picks-schedule-guide-fantasy-football-tips-more')
espn13 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/28175851/week-13-nfl-game-picks-schedule-guide-playoff-scenarios-more')
espn14 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/28224405/week-14-nfl-game-picks-schedule-guide-playoff-scenarios-more')
espn15 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/28277543/week-15-nfl-game-picks-schedule-guide-playoff-scenarios-more')
espn16 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/28328575/week-16-nfl-game-picks-schedule-guide-playoff-scenarios-more')
espn17 = Article.create_with_text('https://www.espn.com/nfl/story/_/id/28366043/week-17-nfl-game-picks-schedule-guide-playoff-scenarios-more')
espn_wild_card = Article.create_with_text('https://www.espn.com/nfl/story/_/page/viewersguide200103/nfl-playoffs-wild-card-round-game-picks-bracket-schedule-odds-bold-predictions-more')
espn_divisional = Article.create_with_text('https://www.espn.com/nfl/story/_/page/viewersguide200110/nfl-playoffs-divisional-round-game-picks-bracket-schedule-odds-bold-predictions-more')
espn_conference = Article.create_with_text('https://www.espn.com/nfl/story/_/page/viewersguide200117/nfl-playoffs-afc-nfc-championship-game-schedule-picks-odds-bold-predictions-more')

Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=1')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=2')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=3')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=4')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=5')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=6')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=7')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=8')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=9')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=10')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=11')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=12')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=13')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=14')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=15')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=16')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=reg&wk=17')

Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=post&wk=1')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=post&wk=2')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=post&wk=3')
Article.create_with_text('https://www.footballdb.com/scores/index.html?lg=NFL&yr=2019&type=post&wk=4')