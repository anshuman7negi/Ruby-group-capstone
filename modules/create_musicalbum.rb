require_relative '../musicalbum'
require_relative '../genre'

module AddMusicAlbum
  def add_music_album
    puts 'Enter the album title: '
    name = gets.chomp

    puts 'Is it on Spotify? (y/n): '
    on_spotify_input = gets.chomp
    on_spotify = (on_spotify_input.downcase == 'y')

    puts 'Enter the publish date (yyyy-mm-dd): '
    publish_date = gets.chomp

    if @genres.empty?
      puts 'No genres available. Please create a new genre:'
      genre_name = gets.chomp
      genre = Genre.new(genre_name)
      @genres << genre
    else
      puts 'Choose the genre for this album (or enter "new" to add a new genre):'
      genre_options
      selected_genre = genre_select

      unless selected_genre
        puts 'Invalid genre selection. Music album not added. Please try again.'
        return
      end

      genre = selected_genre
    end

    music_album = MusicAlbum.new(name, on_spotify, publish_date)
    music_album.set_genre(genre)
    @music_albums << music_album

    puts 'Music album added!'
  end

  def genre_options
    puts 'Available Genres:'
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
    puts 'Enter "new" to add a new genre.'
  end

  def genre_select
    user_input = gets.chomp

    if user_input.downcase == 'new'
      puts 'Enter the name of the new genre:'
      new_genre_name = gets.chomp
      new_genre = Genre.new(new_genre_name)
      @genres << new_genre
      return new_genre
    else
      genre_index = user_input.to_i - 1
      return @genres[genre_index] if genre_index.between?(0, @genres.length - 1)
      return nil
    end
  end
end
