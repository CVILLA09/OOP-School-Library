require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental_manager'
require_relative 'book_manager'
require_relative 'person_manager'

# Class containing app functionality for a basic UI
class App
  def initialize
    puts 'Welcome to School Library App!'
    @book_manager = BookManager.new
    @person_manager = PersonManager.new
    @rental_manager = RentalManager.new(@book_manager, @person_manager)
  end

  def handle_user_choice(choice)
    actions = {
      '1' => -> { @book_manager.list_all_books },
      '2' => -> { @person_manager.list_all_people },
      '3' => lambda {
        print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
        choice = gets.chomp
        print 'Age: '
        age = gets.chomp.to_i
        print 'Name: '
        name = gets.chomp
        additional_info = case choice
                          when '1'
                            print 'Has parent permission? [Y/N]: '
                            gets.chomp.downcase == 'y'
                          when '2'
                            print 'Specialization: '
                            gets.chomp
                          end
        @person_manager.create_person(choice, age, name, additional_info)
      },
      '4' => lambda {
           print 'Title: '
           title = gets.chomp
           print 'Author: '
           author = gets.chomp
           @book_manager.create_book(title, author)
         },
         '5' => lambda {
          return unless @rental_manager.valid_conditions_for_rental?
        
          book_index = @rental_manager.select_book
          return if book_index.nil?
        
          person_index = @rental_manager.select_person
          return if person_index.nil?
        
          print "\nDate: "
          date = gets.chomp
        
          @rental_manager.create_new_rental(book_index, person_index, date)
        },
      '6' => -> { @rental_manager.list_all_rentals_for_person },
      '7' => lambda {
               puts 'Thank you for using this app!'
               exit
             }
    }

    if actions.key?(choice)
      actions[choice].call
    else
      puts 'Invalid option. Please try again.'
    end
  end
end
