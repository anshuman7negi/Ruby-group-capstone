require './books'
require './modules/create_label'

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
    puts '=====Book added successfully====='
    label_info
  end

  def label_info
    if @labels.empty?
      puts 'No labels are available. Please create a label first.'
      create_label
    else
      puts 'Choose a label for this book:'
      display_labels
      label_index = gets.chomp.to_i

      if label_index.between?(1, @labels.length)
        selected_label = @labels[label_index - 1]
        selected_label.add_item(book)
        puts "Book linked to the label: #{selected_label.title}"
      else
        puts 'Invalid label selection.'
      end
    end
  end
end
