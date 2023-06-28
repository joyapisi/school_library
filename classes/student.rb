require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)

    @classroom = classroom
  end

  def to_h
    {
      _class: self.class.name,
      object_id: object_id,
      id: @id,
      classroom: @classroom,
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      rentals: @rentals
    }
  end

  def allocate_classroom(classroom)
    # @classroom = classroom
    classroom.students.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    p '¯\(ツ)/¯'
  end
end
