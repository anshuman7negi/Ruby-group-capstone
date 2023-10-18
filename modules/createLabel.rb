require './label'

module CreateLabel
  def create_label
    puts 'Enter the title for the label:'
    title = gets.chomp
    puts 'Enter the color for the label:'
    color = gets.chomp

    label = Label.new(title, color)
    @labels.push(label)
    puts '=====Label created successfully====='
    puts "\n"
  end
end
