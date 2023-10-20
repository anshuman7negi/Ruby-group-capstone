require './author'
module CreateAuthor
  def create_author
    puts 'Enter the first name:'
    first_name = gets.chomp
    puts 'Enter the last name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors.push(author)
    save_label(@authors, './data/author.json')
    puts "=====Label created successfully=====\n"
  end

  def author_info(game)
    if @authors.empty?
      puts 'No authors are available. Please create an author first.'
      create_author
    else
      display_authors
      puts "\nChoose a author or enter new to add a new label:"
      user_input = gets.chomp
      if user_input.downcase == 'new'
        create_author
      else
        label_index = user_input.to_i
        selected_label(label_index, game)
      end
    end
  end

  def selected_label(label_index, game)
    if label_index.between?(1, @games.length)
      selected_label = @labels[label_index - 1]
      selected_label = Author.new(selected_label['first_name'], selected_label['last_name'])
      selected_label.add_item(game)
      puts "game linked to the author: #{selected_label.first_name}"
    else
      puts 'Invalid author selection.'
    end
  end
end
