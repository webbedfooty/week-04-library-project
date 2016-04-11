######################################################### Books
#   Books                 ############################### Books
get '/books' do
  erb :"books/books_menu"
end

# New 1 and 2 of 6
get '/books/add_new_book' do
  @book = Book.new
  erb :"books/add_new_book"
end

post '/books' do
  @book = Book.new(params)
  if @book.save
    redirect to("/books/list_of_books")
  else
    erb :"books/add_new_book"
  end
end

# Index 3 of 6
get '/books/list_of_books' do
  @books = Book.all
  erb :"books/list_of_books"
end

# Edit 4 and 5 of 6
get '/books/:id/edit_book' do
    @book = Book.find_by_id(params['id'])
  erb :"books/edit_book"
end

post '/books/:id' do
  @book = Book.find_by_id(params['id'])
  if @book.update_attributes(title: params['title'],
      author: params['author'], isbn: params['isbn'])
    redirect to("/books/#{@book.id}")
  else
    erb :"books/edit_book"
  end
end

# Show 6 of 6
get '/books/:id' do
  @books = Book.find_by_id(params['id'])
  erb :"books/id_book"
end
