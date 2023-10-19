require './label'

module CreateLabel
  def create_label
    puts 'Enter the title for the label:'
    title = gets.chomp
    puts 'Enter the color for the label:'
    color = gets.chomp

    label = Label.new(title, color)
    @labels.push(label)
    save_label(@labels, './data/labels.json')
    puts '=====Label created successfully====='
    puts "\n"
  end

  def label_info(book)
    if @labels.empty?
      puts 'No labels are available. Please create a label first.'
      create_label
    else
      display_labels
      puts "\nChoose a label for this book or enter "new" to add a new label:"
      user_input = gets.chomp

      if user_input.downcase == 'new'
        create_label
      else
        label_index = user_input.to_i
        selected_label(label_index, book)
      end
    end
  end

  def selected_label(label_index, book)
    if label_index.between?(1, @labels.length)
      selected_label = @labels[label_index - 1]
      selected_label = Label.new(selected_label['title'], selected_label['color'])
      selected_label.add_item(book)
      puts "Book linked to the label: #{selected_label.title}"
    else
      puts 'Invalid label selection.'
    end
  end
end
