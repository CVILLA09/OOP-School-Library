require_relative 'book'
require_relative 'rental'

class App
    def initialize
      @books = []
      @people = []
    end
  
    def list_all_books
      if @books.empty?
        puts "No books available."
      else
        puts "List of all books:"
        @books.each_with_index do |book, index|
          puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
        end
      end
    end
  
    def list_all_people
      if @people.empty?
        puts "No people available."
      else
        puts "List of all people:"
        @people.each_with_index do |person, index|
          puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  
    def create_person
      puts "Do you want to create a student (1) or a teacher (2)? [Input the number]:"
      choice = gets.chomp
  
      case choice
      when '1'
        create_student
      when '2'
        create_teacher
      else
        puts "Invalid option. No person was created."
      end
    end
  
    def create_student
      print "Age: "
      age = gets.chomp
      print "Name: "
      name = gets.chomp
      print "Has parent permission? [Y/N]: "
      parent_permission = gets.chomp.downcase == 'y'
  
      puts "Student created successfully"
    end
  
    def create_teacher
      print "Age: "
      age = gets.chomp
      print "Name: "
      name = gets.chomp
      print "Specialization: "
      specialization = gets.chomp
  
      puts "Teacher created successfully"
    end
  
    def create_book
      print "Title: "
      title = gets.chomp
      print "Author: "
      author = gets.chomp
  
    new_book = Book.new(title, author)
    @books << new_book
  
      puts "Book created successfully"
    end
  
    def create_rental
        # Display a list of books for the user to select
        puts "Select a book from the following list by number"
        @books.each_with_index do |book, index|
          puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
        end
        book_index = gets.chomp.to_i
    
        # Display a list of people for the user to select
        puts "\nSelect a person from the following list by number (not id)"
        @people.each_with_index do |person, index|
          puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
        person_index = gets.chomp.to_i
    
        # Input the rental date
        print "\nDate: "
        date = gets.chomp
    
        # Create the rental and add it to the book's rentals
        new_rental = Rental.new(date, @books[book_index], @people[person_index])
        @books[book_index].add_rental(new_rental)
    
        puts "Rental created successfully"
      end
    end
  