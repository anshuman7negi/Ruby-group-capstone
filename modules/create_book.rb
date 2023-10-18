require './books'
require './modules/create_label'
require './data/preserve_data'

module CreateBook
  include CreateLabel

  def add_book
    puts 'Who is the publisher of the book?'
    publisher = gets.chomp.to_s
    puts "Choose the cover state of the book (e.g. 'good', 'bad')"
    cover_state = gets.chomp.to_s
    puts 'Enter the publish date (yyyy-mm-dd):'
    publish_date = gets.chomp

    book = Books.new(publisher, cover_state, publish_date)
    @books.push(book)
    save_book(@books, './data/books.json')
    puts '=====Book added successfully====='
    label_info(book)
  end

end
