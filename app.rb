require './person'
require './teacher'
require './student'
require 'book'
require 'rental'

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

def create_rental()
    puts 'Select a book from the following list by number'
    @books.each.with_index { |book, idx| puts "#{idx}) Book #{book.title} by #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number(not ID)'
    @peoples.each.with_index do |person, idx|
      puts "#{idx}) [#{person.class.name}] Name #{person.name}, ID #{person.id}, Age #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:-'
    date = gets.chomp
    Rental.new(@books[book_index], @peoples[person_index], date)
end

def list_rentals()
    @peoples.each do |person|
        if person.id == person_id
          puts 'Rentals:-'
          person.rentals.each { |rental| puts "Date #{rental.date}, Book #{rental.book.title} by #{rental.book.author}" }
        end
    end
end
end