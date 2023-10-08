class Person
    def initialize(id, name, age)
      @id = id
      @name = name
      @age = age
    end
    
    def id
      @id
    end
    
    def name
      @name
    end
    
    def age
      @age
    end

    def name=(new_name)
        @name = new_name
      end
      
      def age=(new_age)
        @age = new_age
      end
  end
  