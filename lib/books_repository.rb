require "books"

class BookRepository
  def all
    sql = "SELECT id, title, author_name FROM books;"
    returned_data = DatabaseConnection.exec_params(sql, [])

    books = []

    returned_data.each{
      |data|
      book = Book.new
      book.id = data['id']
      book.title = data['title']
      book.author_name = data['author_name']
      books << book
    }

    return books

  end
end