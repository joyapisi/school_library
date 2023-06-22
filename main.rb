require './app.rb'

def user_options
    p "Please choose an option by entering a number:
    1 - List all list_books
    2 - List all list_people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit"
    number = gets.chomp.to_i
    p "#{number}"
end

def create_person(app)
    puts 'Do you want to create a student(1) or a teacher(2)? [Input the number]:-'
    option = gets.chomp
    parent_permission = true
    puts 'age:-'
    age = gets.chomp.to_i
    puts 'name:-'
    name = gets.chomp
    puts 'Has parent permission?[Y/N]'
    val = gets.chomp
    parent_permission = false if %w[N n NO no No].include?(val)
