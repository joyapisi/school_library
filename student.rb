require './person'
require './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)

    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include? self
  end

  def allocate_classroom(classroom)
    # @classroom = classroom
    classroom.students.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    p '¯\(ツ)/¯'
  end
end
