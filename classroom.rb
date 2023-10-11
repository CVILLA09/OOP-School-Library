# Class containing data about classroom
class Classroom
  attr_accessor :label
  attr_reader :students # getter for students

  def initialize(label)
    @label = label
    @students = [] # initialize students array
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self # link the student to this classroom
  end
end
