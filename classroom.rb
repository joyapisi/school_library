class classroom
    attr_accessor :label

    def initialize (label)
        @label = label
    end

    def add_students(student)
        @student.push(student)
        student.classroom = self
end