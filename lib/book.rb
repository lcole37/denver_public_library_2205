class Book
  attr_reader :title,
              :publication

  def initialize(data)
    @title = data[:title]
    @author_first_name = data[:author_first_name]
    @author_last_name = data[:author_last_name]
    @publication_date = data[:publication_date]
  end

  def author
    @author_first_name + " " + @author_last_name
  end

  def publication_year
    if @publication_date.length == 4
      @publication_date
    else
      publication_array = @publication_date.split
      publication_array[2]
    end
  end
end
