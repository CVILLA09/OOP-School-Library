# frozen_string_literal: true

require_relative 'person'
require_relative 'classroom'

# Class Student inherited from Person
class Student < Person
  attr_accessor :classroom

  def initialize(age, name, parent_permission: true, classroom: Classroom.new('Default'))
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom.add_student(self)
  end
end
