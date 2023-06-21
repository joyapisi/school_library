require './nameable'

class Person < Nameable
  attr_writer :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    super()
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    @parent_permission == true || @age >= 18
  end

  def correct_name
    @name
  end
end
