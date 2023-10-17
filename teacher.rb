require_relative 'person'

# Class Teacher inherited from Person
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
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
