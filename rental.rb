class Rental
  attr_accessor :date, :book, :person
  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.add_rental(self)
    person.add_rental(self)
  end
  def to_json(*_args)
    {
      'JSON_CLASS' => self.class.name,
      'date' => @date,
      'book_title' => @book.title,
      'book_author' => @book.author,
      'person_id' => @person.id
    }.to_json
  end
end