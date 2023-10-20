require_relative '../musicalbum'
require_relative '../genre'
require_relative 'create_genre'
require './data/preserve_data'

module AddMusicAlbum
  include CreateGenre
  def add_music_album
    puts 'Enter the album title: '
    name = gets.chomp

    puts 'Is it on Spotify? (y/n): '
    on_spotify_input = gets.chomp.downcase
    if %w[y n].include?(on_spotify_input)
      on_spotify = (on_spotify_input == 'y')
    else
      puts 'Invalid input.'
      return
    end

    puts 'Enter the publish date (yyyy-mm-dd): '
    publish_date = gets.chomp

    genre = choose_genre

    music_album = MusicAlbum.new(name, on_spotify, publish_date)
    genre.items << music_album
    music_album.genre = genre
    @music_albums << music_album
    save_musicalbum(@music_albums, './data/musicalbum.json')
    save_genre(@genres, './data/genre.json')

    puts 'Music album added!'
  end
end
