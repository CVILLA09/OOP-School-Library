# Class responsible for rental management
class RentalManager
    attr_accessor :book_manager, :person_manager
  
    def initialize(book_manager, person_manager)
      @book_manager = book_manager
      @person_manager = person_manager
    end
    
    # Select book from available books
    def select_book
      @book_manager.list_all_books
      book_index = gets.chomp.to_i
      return nil unless book_index.between?(0, @book_manager.books.length - 1)
  
      book_index
    end
  
    # Select person from available people
    def select_person
      @person_manager.list_all_people
      person_index = gets.chomp.to_i
      return nil unless person_index.between?(0, @person_manager.people.length - 1)
  
      person_index
    end
  
    def create_new_rental
      return unless valid_conditions_for_rental?
  
      book_index = select_book
      return if book_index.nil?
  
      person_index = select_person
      return if person_index.nil?
  
      print "\nDate: "
      date = gets.chomp
      new_rental = Rental.new(date, @book_manager.books[book_index], @person_manager.people[person_index])
      @book_manager.books[book_index].add_rental(new_rental)
      puts 'Rental created successfully'
    end
  
    def valid_conditions_for_rental?
      if @book_manager.books.empty? || @person_manager.people.empty?
        puts 'There must be at least one book and one person to create a rental.'
        false
      else
        true
      end
    end
  
    def list_all_rentals_for_person
      print 'ID of person: '
      id = gets.chomp.to_i
      person = @person_manager.people.find { |p| p.id == id }
      if person.nil?
        puts 'Person not found.'
        return
      end
      rentals = person.rentals
      if rentals.empty?
        puts "No rentals found for person with ID #{id}."
      else
        puts 'Rentals:'
        rentals.each do |rental|
          puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
        end
      end
    end
  end
  