require_relative 'person'
require_relative 'classroom'

# Class Student inherited from Person
class Student < Person
  attr_accessor :classroom 

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\_(ツ)_/¯'
  end
end
