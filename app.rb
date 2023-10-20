require './modules/create_book'
require './modules/create_musicalbum'
require './data/preserve_data'
require './modules/create_game'
class App
  include CreateBook
  include AddMusicAlbum
  include CreateGame
  def initialize
    load_books = load_data('./data/books.json')
    load_labels = load_data('./data/labels.json')
    load_authors = load_data('./data/author.json')
    load_musicalbums = load_data('./data/musicalbum.json')
    load_genres = load_data('./data/genre.json')
    load_games = load_data('./data/game.json')
    @books = load_books.nil? ? [] : load_books
    @labels = load_labels.nil? ? [] : load_labels
    @music_albums = load_musicalbums.nil? ? [] : load_musicalbums
    @genres = load_genres.nil? ? [] : load_genres
    @games = load_games.nil? ? [] : load_games
    @authors = load_authors.nil? ? [] : load_authors
  end

  def books_list
    puts "\n=====List of your all Books are below=====\n"
    puts 'Your books list is empty.' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index + 1}.  #{book['publisher']}. #{book['cover_state']}. #{book['publish_date']}"
    end
  end

  def display_labels
    if @labels.empty?
      puts "\nYour do not have any labels."
    else
      puts "\nAvailable Labels:"
      @labels.each_with_index do |label, index|
        puts "#{index + 1}. #{label['title']} (#{label['color']})"
      end
    end
  end

  def list_music_albums
    puts 'List of Music Albums:'
    puts '---------------------'
    if @music_albums.empty?
      puts 'No music albums available.'
    else
      @music_albums.each_with_index do |music_album_data, index|
        puts "Album ##{index + 1}:"
        puts "Name: #{music_album_data['name']}"
        puts "On Spotify: #{music_album_data['on_spotify'] ? 'Yes' : 'No'}"
        puts "Publish Date: #{music_album_data['publish_date']}"
        puts "Genre: #{music_album_data['genre_name']}"
        puts '---'
      end
    end
  end

  def list_genres
    puts 'List of Genres:'
    if @genres.empty?
      puts 'No genres available.'
    else
      @genres.each_with_index do |genre, index|
        puts "Genre ##{index + 1}: #{genre['name']}"
      end
    end
  end

  def games_list
    puts "\n=====List of your all Games are below=====\n"
    puts 'Your games list is empty.' if @games.empty?
    @games.each_with_index do |game, index|
      puts "#{index + 1}.  #{game['multiplayer']}. #{game['last_played_at']}. #{game['publish_date']}"
    end
  end

  def display_authors
    if @authors.empty?
      puts "\nYour do not have any authors."
    else
      puts "\nAvailable Authors:"
      @authors.each_with_index do |author, index|
        puts "#{index + 1}. #{author['first_name']} #{author['last_name']}"
      end
    end
  end
end
