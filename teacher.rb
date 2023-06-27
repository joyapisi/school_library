require './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_h
    {
      id: @id,
      age: @age,
      name: @name,
      specialization: @specialization,
      rentals: @rentals
    }
  end
end
