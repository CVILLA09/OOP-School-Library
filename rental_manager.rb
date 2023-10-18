require 'json'
# Class responsible for rental management
class RentalManager
  attr_accessor :book_manager, :person_manager, :rentals

  def initialize(book_manager, person_manager)
    @book_manager = book_manager
    @person_manager = person_manager
    @rentals = []
    load_rentals_from_json if File.exist?('rentals.json')
  end

  def select_book
    @book_manager.list_all_books
    book_index = gets.chomp.to_i
    return nil unless book_index.between?(0, @book_manager.books.length - 1)

    book_index
  end

  def select_person
    @person_manager.list_all_people
    person_index = gets.chomp.to_i
    return nil unless person_index.between?(0, @person_manager.people.length - 1)

    person_index
  end

  def save_rentals_to_json
    File.open('rentals.json', 'w') do |f|
      data_to_write = @rentals.map(&:to_json).to_json
      f.write(data_to_write)
    end
  end

  def load_rentals_from_json
    json_data = File.read('rentals.json')
    array_of_strings = JSON.parse(json_data)
    array_of_strings.each { |string| process_rental(string) }
  rescue JSON::ParserError => e
    puts "Could not parse rentals.json: #{e.message}"
  end

  def process_rental(string)
    hash = JSON.parse(string)
    book = find_book(hash)
    person = find_person(hash)
    create_rental(hash, book, person) if book && person
  end

  def find_book(hash)
    @book_manager.books.find { |b| b.title == hash['book_title'] && b.author == hash['book_author'] }
  end

  def find_person(hash)
    @person_manager.people.find { |p| p.id == hash['person_id'] }
  end

  def create_rental(hash, book, person)
    @rentals << Rental.new(hash['date'], book, person)
  end

  def create_new_rental(book_index, person_index, date)
    new_rental = Rental.new(date, @book_manager.books[book_index], @person_manager.people[person_index])
    @book_manager.books[book_index].add_rental(new_rental)
    @rentals << new_rental
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
