class Teacher < Person
    def initialize (name = "Unknown", age, parent_permission = true, specialization)
        super @name = name
        super @age = age
        super @parent_permission = parent_permission
        @specialization = specialization
    end

        def can_use_services?
            true
        end
end