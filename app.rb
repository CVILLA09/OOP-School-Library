class App
    def initialize
      @books = []  # Initialize an empty array to store books
      @people = []  # Initialize an empty array to store people
      # ... other initializations
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
  
      # Logic to create a student
      puts "Student created successfully"
    end
  
    def create_teacher
      print "Age: "
      age = gets.chomp
      print "Name: "
      name = gets.chomp
      print "Specialization: "
      specialization = gets.chomp
  
      # Logic to create a teacher
      puts "Teacher created successfully"
    end
  
    def create_book
      puts "A new book will be created here."
    end
  
    def create_rental
      puts "A new rental will be created here."
    end
  end
  