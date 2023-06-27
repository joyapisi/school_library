require 'json'
require './person'
require './teacher'
require './student'
require './book'
require './rental'

class App
  def initialize
    # @books = []
    # @peoples = []
    # @rentals = []
    @books = load_data_from_json('books.json')
    @peoples = load_data_from_json('people.json')
    @rentals = load_data_from_json('rentals.json')
  end

  def list_books()
    @books = load_data_from_json('books.json')
    puts 'Book list is empty!' if @books.empty?
    @books.each { |book| puts "Title: #{book.title} Author: #{book.author} \n" }
  end

  def list_people()
    @peoples = load_data_from_json('people.json')
    puts 'No person entered yet.' if @peoples.empty?
    @peoples.each do |people|
      puts "[#{people.class.name}] Name: #{people.name} ID: #{people.id} Age: #{people.age} \n"
    end
  end

  def create_teacher(specialization, age, name)
    @peoples << Teacher.new(specialization, age, name)
    save_data_to_json('people.json', @peoples.map(&:to_h))
    puts 'Person created successfully'
  end

  def create_student(age, name, parent_permission)
    @peoples << Student.new(nil, age, name, parent_permission: parent_permission)
    save_data_to_json('people.json', @peoples.map(&:to_h))
    puts 'Person created successfully'
  end

  def create_book()
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    @books << Book.new(title, author)
    save_data_to_json(@books, 'books.json')
    puts 'Book created successfully'
  end

  def create_rental()
    @books = load_data_from_json('books.json')
    @peoples = load_data_from_json('people.json')

    if @books.empty? || @peoples.empty?
      puts 'There are no books or people to create a rental'
      return
    end
    
    puts 'Select a book from the following list by number'
   
    @books.each.with_index { |book, idx| puts "#{idx}) Book #{book.title} by #{book.author}" }
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number(not ID)'
    
   
    @peoples.each.with_index do |person, idx|
      puts "#{idx}) [#{person.class.name}] Name #{person.name}, ID #{person.id}, Age #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_index], @peoples[person_index])
    save_data_to_json(@rentals, 'rentals.json')
    puts 'Rental created successfully'
  end

  def list_rentals()
    @rentals = load_data_from_json('rentals.json')
    id = gets.chomp.to_i
    @rentals.each do |rental|
      if rental.person.id.eql?(id)
        puts "Date: #{rental.date} Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'Person does not exist'
      end
    end
  end

  # Storing data to files using JSON...
  # def create_person_from_hash(data)
  #   case data['type']
  #   when 'Teacher'
  #     Teacher.new(data['specialization'], data['age'], data['name'])
  #   when 'Student'
  #     Student.new(data['classroom'], data['age'], data['name'], parent_permission: data['parent_permission'])
  #   else
  #     # Handle unknown person type or return a default person object
  #     Person.new(data['age'], data['name'], parent_permission: data['parent_permission'])
  #   end
  # end

  def save_data_to_json(filename, data)
    # File.open(filename, 'w') do |file|
    #   file.write(JSON.generate(data))
   data = data.map(&:to_h)
    # json_data = JSON.generate(formatted_data)
    File.write(filename, JSON.generate(data), mode: 'w')
  end

  def load_data_from_json(filename)
    if File.exist?(filename) and File.size(filename) != 0
      # file_contents = File.read(filename)
      # JSON.parse(file_contents)
      # parsed_data = JSON.parse(file_contents)

      # if parsed_data.is_a?(Array)
      #   parsed_data.map { |data| create_person_from_hash(data) }
      # else
      #   []
      # end
      JSON.parse(File.read(filename))
    else
      []
    end
  end

  # def save_all_data
  #   save_data_to_json('books.json', @books)
  #   save_data_to_json('people.json', @peoples.map(&:to_h))
  #   save_data_to_json('rentals.json', @rentals)
  # end

  # def load_all_data
  #   @books = load_data_from_json('books.json')
  #   @peoples = load_data_from_json('people.json')
  #   @rentals = load_data_from_json('rentals.json')
  # end
end
