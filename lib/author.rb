require 'book'

class Author
  attr_reader :books

  def initialize(data)
    @first_name = data[:first_name]
    @last_name = data[:last_name]
    @books = []
  end

  def name
    @first_name + " " + @last_name
  end

  def write(name, date)
    new_book = Book.new({author_first_name: @first_name, author_last_name: @last_name, title: name, publication_date: date})
    @books << new_book
    return new_book
  end
end
