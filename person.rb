require './nameable'

class Person < Nameable
  attr_reader :id, :parent_permission, :rentals
  attr_accessor :name, :age

  def initialize(age, parent_permission, name = 'Unknown')
    @id = Random.rand(0..1000)
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
