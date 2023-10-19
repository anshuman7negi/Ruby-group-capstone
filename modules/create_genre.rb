require_relative '../musicalbum'
require_relative '../genre'
require './data/preserve_data'

module CreateGenre
  def choose_genre
    if @genres.empty?
      puts 'No genres available.'
      puts 'Please enter a new genre:'
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
    genre
  end

  def genre_options
    puts 'Choose From Available Genres:'
    @genres.each_with_index do |genre, index|
      puts "-> #{genre['name']}"
    end
    puts 'Or Enter "new" to add a new genre.'
  end

  def genre_select
    user_input = gets.chomp

    if user_input.downcase == 'new'
      puts 'Enter the name of the new genre:'
      new_genre_name = gets.chomp
      new_genre = Genre.new(new_genre_name)
      @genres << new_genre
      new_genre
    else
      selected_genre_data = @genres.find { |genre_data| genre_data['name'].downcase == user_input.downcase }
      if selected_genre_data
        selected_genre = Genre.new(selected_genre_data['name'])
        selected_genre.id = selected_genre_data['id']
        selected_genre
      else
        puts 'Invalid genre selection. Music album not added. Please try again.'
        return nil
      end
    end
  end
end
