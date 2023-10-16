class Main
  def display_options
    puts 'Welcome to the Catalog of my Things app'
    puts 'Please choose an option:'
    puts '7 - Exit app'
  end

  def get_choice
    gets.chomp.to_i
  end
end