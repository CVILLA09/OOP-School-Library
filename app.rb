require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental_manager'

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
    @rental_manager = RentalManager.new(@book_manager, @person_manager)
  end
  
  def handle_user_choice(choice)
    actions = {
      '1' => -> { @book_manager.list_all_books },
      '2' => -> { @person_manager.list_all_people },
      '3' => -> { @person_manager.create_person },
      '4' => -> { @book_manager.create_book },
      '5' => -> { @rental_manager.create_new_rental },
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
