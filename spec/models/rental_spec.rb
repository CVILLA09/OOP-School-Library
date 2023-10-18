require 'json'
require './rental'
require './book'
require './person'

RSpec.describe Rental do
  let(:book) { Book.new('Sample Book', 'Sample Author') }
  let(:person) { Person.new('John Doe') }
  let(:date) { '10-18-2023' }
  let(:rental) { Rental.new(date, book, person) }
  describe 'Create a new rental' do
    it 'Should creates a new instance of Rental' do
      expect(rental).to be_a(Rental)
    end
    it 'Should associates the rental with the specified book' do
      expect(rental.book).to eq(book)
      expect(book.rentals).to include(rental)
    end
    it 'Should associates the rental with the specified person' do
      expect(rental.person).to eq(person)
      expect(person.rentals).to include(rental)
    end
  end
  describe 'Load data from json' do
    it 'Should returns data from json' do
      json = rental.to_json
      expect { JSON.parse(json) }.not_to raise_error
      parsed_json = JSON.parse(json)
      expect(parsed_json['JSON_CLASS']).to eq('Rental')
      expect(parsed_json['date']).to eq(date.to_s)
      expect(parsed_json['book_title']).to eq('Sample Book')
      expect(parsed_json['book_author']).to eq('Sample Author')
      expect(parsed_json['person_id']).to eq(person.id)
    end
  end
end