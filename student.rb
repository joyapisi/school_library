class Student < Person
    def initialize (name = "Unknown", age, parent_permission = true, classroom)
        super @name = name
        super @age = age
        super @parent_permission = parent_permission
        @classroom = classroom
    end
end

    def play_hooky
        p "¯\(ツ)/¯"
    end

