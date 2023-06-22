class App 
    def initialize
        @books = []
        @peoples = []
    end

    def list_books()
        @books.each { |book| puts "Title: #{book.title} Author: #{book.author} \n" } 
    end

    def list_people()
        @peoples.each do |people|
            puts "[#{people.class.name}] Name: #{people.name} ID: #{people.id} Age: #{people.age} \n"  
    end
end
    
    def create_teacher(age, specialization, parent_permission, name)
        @peoples << Teacher.new(age, specialization, parent_permission: parent_permission, name: name)
      end

      def create_student(age, name, parent_permission)
        @peoples << Student.new(age, name, parent_permission: parent_permission)
      end

      def create_book()
        puts 'Title:'
        title = gets.chomp
        puts 'Author:'
        author = gets.chomp
        @books << Book.new(title, author)
end

end