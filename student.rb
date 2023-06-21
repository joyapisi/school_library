require './person'

attr_accessor :classroom

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)

    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?self
  end

  def play_hooky
    p '¯\(ツ)/¯'
  end

  
end
