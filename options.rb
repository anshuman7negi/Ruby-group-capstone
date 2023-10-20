# frozen_string_literal: true

require './app'

class Options
  OPTIONS = {
    list_books: ->(app) { app.books_list },
    list_albums: ->(app) { app.list_music_albums },
    list_genres: ->(app) { app.list_genres },
    list_labels: ->(app) { app.display_labels },
    add_book: ->(app) { app.add_book },
    add_album: ->(app) { app.add_music_album },
    exit: ->(_) { exit }
  }.freeze

  def display_options
    puts '======Welcome to the Catalog of my Things app======'
    loop do
      puts "\nPlease choose an option:"
      @app = App.new
      OPTIONS.each_with_index do |(key, _description), index|
        formatted_key = key.to_s.split('_').map(&:capitalize).join(' ')
        puts "#{index + 1} - #{formatted_key}"
      end
      user_option = gets.chomp.to_i
      operation(user_option)
    end
  end

  def operation(user_option)
    action = OPTIONS.values[user_option - 1]
    if action
      action.call(@app)
    else
      puts 'Invalid option.'
    end
  end
end
