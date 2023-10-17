class Options
  def initialize
    @option = [
      'can we archived',
      'move to archived',
      'exit'
    ]
  end

  def display_options
    puts 'Welcome to the Catalog of my Things app'
    loop do
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
    when 1 then archived
    when 2 then move_to_archive
    when 3 then exit
    else
      puts 'invalid option'
    end
  end

  def archived
    puts 'archived'
  end

  def move_to_archive
    puts 'moved to archive'
  end
end
