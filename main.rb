require './app.rb'

def user_options
    puts 'Please choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit'
    number = gets.chomp.to_i
    puts "#{number}"
end

def create_person(app)
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
    input_option = gets.chomp.to_i
    parent_permission = true
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp
    puts 'Has parent permission?[Y/N]:'
    val = gets.chomp
    parent_permission = false if %w[N n NO no No].include?(val)
    
    case input_option.to_i
    when 1
      app.create_student(age, name, parent_permission)
    when 2
      puts 'Specialization:'
      specialization = gets.chomp
      app.create_teacher(age, specialization, name, parent_permission)
    else
      puts 'Oops! Wrong input.'
    end
  end

  def sort_input_option(input_option, app)
    case input_option
    when 3
      create_person(app)
    when 4
      app.create_book
      puts 'Title:'
      title = gets.chomp
      puts 'Author:'
      author = gets.chomp
    when 5
      app.create_rental
    when 6
      puts 'ID of person:'
      id = gets.chomp.to_i
      app.list_person_rentals(id)
    when 7
      puts 'Thank you for using this app!'
      return false
    else
      puts 'Oops! Wrong input. Please try again'
    end
    true
  end

  def main
    status = true
    app = App.new
    while status
      run_input_option
      input_option = gets.chomp.to_i
      if input_option == 1
        app.list_books
    elsif input_option == 2
        app.list_peoples
      else
        status = sort_input_option(input_option, app)
      end
    end
  end
  
  main