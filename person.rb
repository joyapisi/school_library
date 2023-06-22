require './nameable'

class Person < Nameable
  attr_writer :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
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

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end
