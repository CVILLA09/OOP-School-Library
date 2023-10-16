require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'

# Class responsible for book management
class BookManager
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_all_books
    if @books.empty?
      puts 'No books available.'
    else
      puts 'List of all books:'
      @books.each_with_index do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    new_book = Book.new(title, author)
    @books << new_book
    puts 'Book created successfully'
  end
end

# Class responsible for person management
class PersonManager
  attr_accessor :people

  def initialize
    @people = []
  end

  def list_all_people
    if @people.empty?
      puts 'No people available.'
    else
      puts 'List of all people:'
      @people.each_with_index do |person, index|
        puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    choice = gets.chomp
    case choice
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option. No person was created.'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    new_student = Student.new(age, name, parent_permission: parent_permission)
    @people << new_student
    puts 'Student created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    new_teacher = Teacher.new(specialization, age, name)
    @people << new_teacher
    puts 'Teacher created successfully'
  end
end

# Class containing app functionality for a basic UI
class App
  def initialize
    puts 'Welcome to School Library App!'
    @book_manager = BookManager.new
    @person_manager = PersonManager.new
  end

  def handle_user_choice(choice)
    case choice
    when '1'
      @book_manager.list_all_books
    when '2'
      @person_manager.list_all_people
    when '3'
      @person_manager.create_person
    when '4'
      @book_manager.create_book
    when '5'
      create_new_rental
    when '6'
      list_all_rentals_for_person
    when '7'
      puts 'Thank you for using this app!'
      exit
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def select_book(books)
    @book_manager.list_all_books
    book_index = gets.chomp.to_i
    return nil unless book_index.between?(0, books.length - 1)

    book_index
  end

  def select_person(people)
    @person_manager.list_all_people
    person_index = gets.chomp.to_i
    return nil unless person_index.between?(0, people.length - 1)

    person_index
  end

  def create_new_rental
    return unless valid_conditions_for_rental?

    book_index = select_book(@book_manager.books)
    return if book_index.nil?

    person_index = select_person(@person_manager.people)
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
