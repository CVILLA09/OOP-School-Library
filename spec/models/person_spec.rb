require './person'
require './rental'
require './book'

RSpec.describe Person do
  let(:person) { Person.new(20, 'Jhon') }
  let(:book) { Book.new('Mock Book', 'Mock Author') }
  let(:rental) { Rental.new('2023-10-18', book, person) }

  describe 'Create a new person' do
    it 'Should creates a new instance of person' do
      expect(person).to be_a(Person)
    end

    it 'Should have a name and age' do
      expect(person.name).to eq('Jhon')
      expect(person.age).to eq(20)
    end
  end

  describe 'add_rental' do
    it 'adds a rental to the person' do
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
    end

    it 'sets the person for the rental' do
      person.add_rental(rental)
      expect(rental.person).to eq(person)
    end
  end

  describe 'Can he use services?' do
    it 'Should use services' do
      expect(person.can_use_services?).to eq(true)
    end
  end

  describe 'Correct name' do
    it 'Should return the name' do
      expect(person.correct_name).to eq('Jhon')
    end
  end
end
