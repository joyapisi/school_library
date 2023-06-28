require 'json'

class DataStorage
  def initialize(books, peoples, rentals)
    @books = load_data_from_json('books.json')
    @peoples = load_data_from_json('people.json')
    @rentals = load_data_from_json('rentals.json')
  end

  def save_data_to_json(filename, data)
    data = data.map(&:to_h)
    File.write(filename, JSON.generate(data), mode: 'w')
  end

  def load_data_from_json(filename)
    if File.exist?(filename) && File.size(filename) != 0
      json_data = JSON.parse(File.read(filename))

      json_data.map do |data|
        Book.new(data['title'], data['author'])
      end
    else
      []
    end
  end

  def load_books 
    @books = load_data_from_json('books.json')
  end

  def load_people
    @peoples = load_data_from_json('people.json')
    puts 'No person entered yet.' if @peoples.empty?
  end

  def save_teacher
    save_data_to_json('people.json', @peoples.map(&:to_h))
    puts 'Person created successfully'
  end

  def save_student
    save_data_to_json('people.json', @peoples.map(&:to_h))
    puts 'Person created successfully'
  end

  def save_book
    save_data_to_json('books.json', @books.map(&:to_h))
    puts 'Book created successfully'
  end

  def save_rentals
    @books = load_data_from_json('books.json') || []
    @peoples = load_data_from_json('people.json') || []
    @rentals = load_data_from_json('rentals.json') || []

    if @books.empty? || @peoples.empty?
      puts 'There are no books or people to create a rental'
      return
    end

    save_data_to_json('rentals.json', @rentals.map(&:to_h))
    puts 'Rental created successfully'
  end

  def load_rentals
    @rentals = load_data_from_json('rentals.json')
  end

  def load_people
    @peoples = load_data_from_json('people.json') || []
  end

end
