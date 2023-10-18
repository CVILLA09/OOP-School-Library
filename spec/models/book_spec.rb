require 'json'
require './rental'
require './book'

RSpec.describe Book do
  let(:book) { Book.new('Mock Book', 'Mock Author') }

  describe 'Create a new book' do
    it 'Should creates a new instance of Book' do
      expect(book).to be_a(Book)
    end

    it 'Should have a title and an author' do
      expect(book.title).to eq('Mock Book')
      expect(book.author).to eq('Mock Author')
    end

    it 'Should have an empty rentals array' do
      expect(book.rentals).to be_empty
    end
  end

  describe 'Load data from json' do
    it 'Should return the book from json' do
      json = book.to_json
      expect { JSON.parse(json) }.not_to raise_error
      parsed_json = JSON.parse(json)
      expect(parsed_json['JSON_CLASS']).to eq('Book')
      expect(parsed_json['title']).to eq('Mock Book')
      expect(parsed_json['author']).to eq('Mock Author')
    end
  end

  describe 'Save data to json' do
    it 'Should save a new book' do
      json = {
        'JSON_CLASS' => 'Book',
        'title' => 'New Book',
        'author' => 'New Author'
      }.to_json

      new_book = Book.new_from_json(JSON.parse(json))
      expect(new_book).to be_a(Book)
      expect(new_book.title).to eq('New Book')
      expect(new_book.author).to eq('New Author')
    end
  end
end
