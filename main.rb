require_relative 'app'

def display_menu
  puts "\nPlease choose an option by entering a number:"
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
end

# Initialize the App
app = App.new

# Main program loop
loop do
  display_menu
  choice = gets.chomp
  break if choice == 'quit'
  
  # Delegate the actual work to the App class
  app.handle_user_choice(choice)
end