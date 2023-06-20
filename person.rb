class Person
    def initialize(name = "Unknown", age, parent_permission = true)
      @name = name
      @age = age
      @parent_permission = parent_permission
    end
  
    attr_writer :id
    attr_accessor :name
    attr_accessor :age
  
    def of_age?
      @age >= 18
    end
  
    def can_use_services?
      @parent_permission == true && @age >= 18
    end
  
    private :can_use_services?
  end
  