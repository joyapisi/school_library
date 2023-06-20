class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_writer :id
  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end

  def can_use_services?
    @parent_permission == true && @age >= 18
  end

  private :can_use_services?
end
