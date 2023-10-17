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

  def to_json(*_args)
    {
      'JSON_CLASS' => self.class.name,
      'name' => @name,
      'age' => @age,
      'id' => @id,
      'parent_permission' => @parent_permission
    }.to_json
  end  
end
