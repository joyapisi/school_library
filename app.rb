require './person'
require './teacher'
require './student'
require './book'
require './rental'

class App
  def initialize
    @books = []
    @peoples = []
    @rentals = []
  end

  def list_books()
    @books.each { |book| puts "Title: #{book.title} Author: #{book.author} \n" }
  end

  def list_people()
    @peoples.each do |people|
      puts "[#{people.class.name}] Name: #{people.name} ID: #{people.id} Age: #{people.age} \n"
    end
  end

  def create_teacher(specialization, age, name)
    @peoples << Teacher.new(age, name, specialization)
  end

  def create_student(age, name, parent_permission)
    @peoples << Student.new(nil, age, name, parent_permission: parent_permission)
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
    @rentals << Rental.new(date, @books[book_index], @peoples[person_index])
  end

  def list_rentals()
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id.eql?(id)
        puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'Person does not exist'
      end
    end
  end
end