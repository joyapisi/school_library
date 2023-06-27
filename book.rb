require './rental'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_h
    {
      _class: self.class.name,
      object_id: object_id,
      title: @title,
      author: @author,
      rentals: @rentals
    }
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

end
