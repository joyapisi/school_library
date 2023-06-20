class Student < Person
    def initialize (name = "Unknown", age, parent_permission = true, classroom)
        @name = name
        @age = age
        @parent_permission = parent_permission
        @classroom = classroom
    end

    def play_hooky
        p "¯\(ツ)/¯"
    end
end
