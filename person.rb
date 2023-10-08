class Person
    def initialize(name = "Unknown", age, parent_permission = true)
      @id = Random.rand(1..1000)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  
    # Getter methods
    def id
      @id
    end
    
    def name
      @name
    end
    
    def age
      @age
    end
  
    # Setter methods
    def name=(new_name)
      @name = new_name
    end
    
    def age=(new_age)
      @age = new_age
    end
  
    # Public method to check if the person can use services
    def can_use_services?
      of_age? || @parent_permission
    end
  
    private
  
    # Private method to check if the person is of age
    def of_age?
      @age >= 18
    end
  end
  