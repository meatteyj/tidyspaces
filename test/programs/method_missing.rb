require 'ostruct'

class Author
  attr_accessor :first_name, :last_name, :genre

  def bauthor
    OpenStruct.new(first_name: first_name, last_name: last_name,
    genre: genre)
  end

  def method_missing(method_name, *arguments, &block)
    if method_name.to_s =~ /author_(.*)/
      bauthor.send($1, *arguments, &block)
    else
      super
    end
  end
end
a = Author.new
a.first_name = "James"
a.last_name = "Meattey"
a.genre = "Programming"
p a.first_name
p a.bauthor
p a.author_genre
