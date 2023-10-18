require './app'

class Options
  def initialize
    @option = [
      'List all books',
      'List all music albums',
      'List all genres',
      'List all labels',
      'Add a book',
      'Add a music album',
      'exit'
    ]
    @app = App.new
  end

  def display_options
    puts '======Welcome to the Catalog of my Things app======'
    loop do
      puts "\n"
      puts 'Please choose an option:'

      @option.each_with_index do |item, index|
        puts "#{index + 1} => #{item}"
      end
      user_option = gets.chomp.to_i
      operation(user_option)
    end
  end

  def operation(user_option)
    case user_option
    when 1 then @app.books_list
    when 2 then @app.list_music_albums
    when 3 then @app.list_genres
    when 4 then @app.display_labels
    when 5 then @app.add_book
    when 6 then @app.add_music_album
    when 7 then exit
    else
      puts '=======invalid option==========='
    end
  end
end
