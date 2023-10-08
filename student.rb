require_relative 'person'

class Student < Person
  def initialize(name = "Unknown", age, classroom, parent_permission = true)
    super(name, age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\\_(ツ)_/¯"
  end
end
