class Main

  def initialize
    @option = [
      'can we archived',
      'move to archived',
      'exit'
    ]
  end

  def display_options
    puts 'Welcome to the Catalog of my Things app'
    puts 'Please choose an option:'
    
    @option.each_with_index do |item,index|
      puts "#{index+1} => #{item}"
    end
  end

end

main = Main.new
main.display_options