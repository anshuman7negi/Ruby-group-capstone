require './app'

class Options
  def initialize
    @option = [
      'List all books',
      'List all labels',
      'Add a book',
      'exit'
    ]
    @app = App.new
  end

  def display_options
    puts '======Welcome to the Catalog of my Things app======'
    puts "\n"
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
    when 2 then @app.display_labels
    when 3 then @app.add_book
    when 4 then exit
    else
      puts '=======invalid option==========='
    end
  end
end
