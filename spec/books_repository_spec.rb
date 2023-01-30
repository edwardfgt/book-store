require 'books_repository'


def reset_books_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_books_table
  end

  it "return an array of all books" do
    repo = BookRepository.new
    Books = repo.all

    # expect(Books).to eq nil
    expect(Books.length).to eq 2 
    expect(Books[0].title).to eq "The Lean Startup"
    expect(Books[0].author_name).to eq "Eric Ries"
    expect(Books[1].title).to eq "1984"
  end
end





