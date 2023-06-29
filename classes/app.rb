require 'json'
require 'pry'
require_relative 'school_library_app.rb'
require_relative  'person'
require_relative 'teacher'
require_relative 'student'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    # @books = []
    # @peoples = []
    # @rentals = []
    @books = load_data_from_json('./json/books.json') 
    @peoples = load_data_from_json('./json/people.json') 
    @rentals = load_data_from_json('./json/rentals.json') 
  end

  def list_books()
    @books = load_data_from_json('./json/books.json')
    puts 'Book list is empty!' if @books.empty?
    @books.each { |book| puts "Title: #{book.title} Author: #{book.author} \n" }
  end

  def list_people()
    @peoples = load_data_from_json('./json/people.json')
    puts 'No person entered yet.' if @peoples.empty?
    @peoples.each do |person| 
      puts "[#{person.class.name}] Name: #{person.name} ID: #{person.id} Age: #{person.age} \n"
    end
  end

  def create_teacher(specialization, age, name)
    @peoples << Teacher.new(specialization, age, name)
    # save_data_to_json('people.json', @peoples.map(&:to_h))
    puts 'Person created successfully'
  end

  def create_student(age, name, parent_permission)
    @peoples << Student.new(nil, age, name, parent_permission: parent_permission)
    # save_data_to_json('people.json', @peoples.map(&:to_h))
    puts 'Person created successfully'
  end

  def create_book()
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    # save_data_to_json('books.json', @books.map(&:to_h))
    puts 'Book created successfully'
  end

  def create_rental()
    @books = load_data_from_json('./json/books.json') || []
    @peoples = load_data_from_json('./json/people.json') || []
    @rentals = load_data_from_json('./json/rentals.json') || []

    if @books.empty? || @peoples.empty?
      puts 'There are no books or people to create a rental'
      return
    end
    
    puts 'Select a book from the following list by number'
   
    @books.each.with_index { |book, idx| puts "#{idx}) Book #{book.title} by #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number(not ID)'
    
   
    @peoples.each.with_index do |person, idx|
      # if person.is_a?(Person)
        puts "#{idx}) [#{person.class.name}] Name  #{person.name}, ID #{person.id}, Age #{person.age}"
    # end
  end
    person_index = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_index], @peoples[person_index])
    save_data_to_json('./json/rentals.json', @rentals.map(&:to_h))
    puts 'Rental created successfully'
  end

  def list_rentals()
    @rentals = load_data_from_json('./json/rentals.json')
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id.eql?(id)
        puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'Person does not exist'
      end
    end
  end

  def save_data_to_json

    updated_people = []

    @peoples.each do |person|
      if person.instance_of?(::Teacher)
        updated_people << { 'type' => 'Teacher', 'id' => person.id, 'name' => person.name, 'age' => person.age,
                            'specialization' => person.specialization }
      elsif person.instance_of?(::Student)
        updated_people << { 'type' => 'Student', 'id' => person.id, 'name' => person.name, 'age' => person.age,
                            'parent_permission' => person.parent_permission }
      end
    end

    File.write('./json/people.json', JSON.pretty_generate(updated_people))
    updated_books = []

    @books.each do |book|
      updated_books << {'type' => 'Book', 'title' => book.title, 'author' => book.author }
    
    File.write('./json/books.json', JSON.pretty_generate(updated_books))

    updated_rentals = []

    @rentals.each do |rental|
      updated_rentals << {'type' => 'Rental', 'person_name' => rental.person.name, 'book_titles' => rental.book.title,
                           'date' => rental.date }
    end

    File.write('./json/rentals.json', JSON.pretty_generate(updated_rentals))
  end


  def load_data_from_json(filename)
    if File.exist?(filename) && File.size(filename) != 0
      json_data = JSON.parse(File.read(filename))
  
      json_data.map do |data|
        case data['type']
        when 'Teacher'
          Teacher.new(data['specialization'], data['age'], data['name'])
        when 'Student'
          Student.new(nil, data['age'], data['name'], parent_permission: data['parent_permission'])
        when 'Book'
          Book.new(data['title'], data['author'])
        end
        when 'Rental'
            rentee = @peoples.select { |person| person.name == rental['name'] }
            rented_book = @books.select { |book| book.title == rental['title'] }
            Rental.new(rental['date'], rented_book[0], rentee[0])
    else
      []
    end
  end
  
end

