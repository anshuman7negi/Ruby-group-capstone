require './game'
require './author'
require './item'
require './modules/create_author'
module CreateGame
  include CreateAuthor
  def add_game
    puts 'Is this a multiplayer game (true/false) ?'
    multiplayer = gets.chomp.to_s
    puts 'Enter the last played game date (yyyy-mm-dd):'
    last_played_at = gets.chomp.to_s
    puts 'Enter the game publish date (yyyy-mm-dd):'
    publish_date = gets.chomp
    game = Game.new(multiplayer, last_played_at, publish_date)
    @games.push(game)
    save_book(@games, './data/game.json')
    puts '=====Game added successfully====='
    author_info(game)
  end
end