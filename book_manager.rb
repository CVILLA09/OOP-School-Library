require 'json'

# Class responsible for book management
class BookManager
  attr_accessor :books

  def initialize
    @books = []
    load_books_from_json if File.exist?('books.json')
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

  def create_book(title, author)
    new_book = Book.new(title, author)
    @books << new_book
    puts 'Book created successfully'
  end

  # Serialize the @books array to JSON and save it to 'books.json'
  def save_books_to_json
    File.open('books.json', 'w') do |f|
      data_to_write = @books.map(&:to_json).to_json
      f.write(data_to_write)
    end
  end

  # Read the 'books.json' file, deserialize the JSON data, and populate the @books array
  def load_books_from_json
    json_data = File.read('books.json')
    array_of_strings = JSON.parse(json_data)

    array_of_strings.each do |string|
      hash = JSON.parse(string)
      @books << Book.new(hash['title'], hash['author'])
    end
  end
end
