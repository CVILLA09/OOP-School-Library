require_relative 'nameable'
require_relative 'rental'

# This class encapsulates the attributes and behaviors of a person in the school library.
class Person < Nameable
  attr_accessor :name, :age, :rentals
  
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # Method to add a rental
  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  # Public method to check if the person can use services
  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  # Private method to check if the person is of age.
  def of_age?
    @age >= 18
  end
end
