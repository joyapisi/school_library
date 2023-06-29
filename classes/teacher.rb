require_relative 'person'

class Teacher < Person
  attr_reader :specialization
  
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def to_h
    {
      _class: self.class.name,
      object_id: object_id,
      id: @id,
      age: @age,
      name: @name,
      specialization: @specialization,
      rentals: @rentals
    }
  end

  def can_use_services?
    true
  end
end
