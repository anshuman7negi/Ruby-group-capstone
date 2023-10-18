class BookOption
  def add_book
    puts 'Who is the publisher of the book?'
    publisher = gets.chomp.to_s
    puts "Choose the cover state of the book (e.g. 'good', 'bad')"
    cover_state = gets.chomp.to_s
    puts 'Enter the publish date (yyyy-mm-dd):'
    publish_date = gets.chomp

    book = Book.new(publisher, cover_state, publish_date)
    @books.push(@book)
    puts 'Book added successfully'
    puts '********************************'
  end
end
