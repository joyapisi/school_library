#   def speak
#     "Bla bla bla"
#   end
# end

# animal_1 = Animal.new(4, "Rex")
# animal_2 = Animal.new(8)

# animal_1.speak
# animal_2.speak

class Animal
  def initialize(type, number_of_legs, name = "Unknown")
    @id = Random.rand(1..1000)
    @name = name
    @number_of_legs = number_of_legs
    @type = type
  end

  def id
    @id
  end

  def type
    @type
  end

  def number_of_legs
    @number_of_legs
  end

  def name
    @name
  end

  def name=(value)
    @name = value
  end

  def speak
    "grrr"
  end
end
