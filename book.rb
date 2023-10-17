require 'json'
require_relative 'rental'

# Class containing data about books
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end

  # Return a JSON representation of the book
  def to_json(*_args)
    {
      'JSON_CLASS' => self.class.name,
      'title' => @title,
      'author' => @author
    }.to_json
  end

  def self.new_from_json(json_hash)
    new(json_hash['title'], json_hash['author'])
  end
end
