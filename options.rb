require './app'

class Options
  OPTIONS = {
    list_books: 'List all books',
    list_albums: 'List all music albums',
    list_genres: 'List all genres',
    list_labels: 'List all labels',
    add_book: 'Add a book',
    add_album: 'Add a music album',
    exit: 'exit'
  }

  def display_options
    puts '======Welcome to the Catalog of my Things app======'
    loop do
      puts '\nPlease choose an option:'
      @app = App.new
      OPTIONS.each_with_index do |(_key, value), index|
        puts "#{index + 1} - #{value}"
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
