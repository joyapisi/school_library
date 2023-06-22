require './app'

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
  puts number
end

def create_person(app)
  puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:'
  choice = gets.chomp.to_i

  parent_permission = ask_for_permission

  puts 'Age:'
  age = gets.chomp.to_i
  puts 'Name:'
  name = gets.chomp

  case choice
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

def ask_for_permission
  puts 'Has parent permission? [Y/N]:'
  val = gets.chomp.downcase
  !%w[n no].include?(val)
end

def sort_option(choice, app)
  case choice
  when 3
    create_person(app)
  when 4
    app.create_book
    puts 'Title:'
    gets.chomp
    puts 'Author:'
    gets.chomp
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
    run_choice
    choice = gets.chomp.to_i
    if choice == 1
      app.list_books
    elsif choice == 2
      app.list_peoples
    else
      status = sort_inpt_option(choice, app)
    end
  end
end

main
