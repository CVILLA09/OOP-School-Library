class App
    def initialize
      @books = []  # Initialize an empty array to store books
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
      puts "List of all people will be displayed here."
    end
  
    def create_person
      puts "A new person will be created here."
    end
  
    def create_book
      puts "A new book will be created here."
    end
  
    def create_rental
      puts "A new rental will be created here."
    end
  end
  