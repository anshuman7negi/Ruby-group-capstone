require './modules/create_book'
require './modules/create_musicalbum'

class App
  include CreateBook
  include AddMusicAlbum

  def initialize
    @books = []
    @labels = []
    @music_albums = []
    @genres = []
  end

  def books_list
    puts "\n"
    puts '=====List of your all Books are below====='
    puts "\n"
    puts 'Your books list is empty.' if @books.empty?
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.publisher}. #{book.cover_state}. #{book.publish_date}"
    end
  end

  def display_labels
    if @labels.empty?
      puts "\nYour do not have any labels."
    else
      puts "\nAvailable Labels:"
      @labels.each_with_index do |label, index|
        puts "#{index + 1}. #{label.title} (#{label.color})"
      end
    end
  end

  def list_music_albums
    puts 'List of Music Albums:'
    puts '---------------------'
    if @music_albums.empty?
      puts 'No music albums available.'
    else
      @music_albums.each_with_index do |music_album, index|
        puts "Album ##{index + 1}:"
        puts "Name: #{music_album.name}"
        puts "On Spotify: #{music_album.on_spotify ? 'Yes' : 'No'}"
        puts "Publish Date: #{music_album.publish_date}"
        puts "Genre: #{music_album.genre.name}"
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
        puts "Genre ##{index + 1}: #{genre.name}"
      end
    end
  end
end
