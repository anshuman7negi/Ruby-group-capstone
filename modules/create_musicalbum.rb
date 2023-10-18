require_relative '../musicalbum'
require_relative '../genre'
require_relative 'create_genre'

module AddMusicAlbum
include CreateGenre
  def add_music_album
    puts 'Enter the album title: '
    name = gets.chomp

    puts 'Is it on Spotify? (y/n): '
    on_spotify_input = gets.chomp
    on_spotify = (on_spotify_input.downcase == 'y')

    puts 'Enter the publish date (yyyy-mm-dd): '
    publish_date = gets.chomp

    genre = choose_genre

    music_album = MusicAlbum.new(name, on_spotify, publish_date)
    music_album.assign_genre(genre)
    @music_albums << music_album

    puts 'Music album added!'
  end
end
