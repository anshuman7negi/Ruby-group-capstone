require './modules/createBook'

class App
  include CreateBook

  def initialize
    @books = []
    @labels = []
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
end
