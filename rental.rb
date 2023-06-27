require './person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_h
    {
      date: @date,
      book: @book.to_h,
      person: @person.to_h
    }
  end
end
