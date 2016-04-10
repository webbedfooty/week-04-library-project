require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

require_relative "lib/book.rb"
require_relative "lib/library.rb"
require_relative "lib/patron.rb"
require_relative "lib/staff_member.rb"


get '/' do
  erb :main_menu
end

######################################################### Libraries
#   Libraries             ############################### Libraries
get '/libraries' do
  erb :libraries_menu
end

# Yet to be implemented
get '/libraries/reassign_book' do
  erb :reassign_book
end

get '/libraries/reassign_staff_member' do
  erb :reassign_staff_member
end

# New 1 and 2 of 6
get '/libraries/add_new_library' do
  @library = Library.new
  erb :add_new_library
end

post '/libraries' do
  @library = Library.new(params)
  if @library.save
    redirect to("/libraries/list_of_libraries")
  else
    erb :add_new_library
  end
end

# Index 3 of 6
get '/libraries/list_of_libraries' do
  @libraries = Library.all
  erb :list_of_libraries
end

# Edit 4 and 5 of 6
get '/libraries/:id/edit_library' do
    @library = Library.find_by_id(params['id'])
  erb :edit_library
end

post '/libraries/:id' do
  @library = Library.find_by_id(params['id'])
  if @library.update_attributes(branch_name: params['branch_name'],
      address: params['address'], phone_number: params['phone_number'])
    redirect to("/libraries/#{@library.id}")
  else
    erb :edit_library
  end
end

# Show 6 of 6
get '/libraries/:id' do
    @libraries = Library.find_by_id(params['id'])
  erb :id_library
end

######################################################### Books
#   Books                 ############################### Books
get '/books' do
  erb :books_menu
end

# Yet to be implemented
get '/books/check_out_books' do
  erb :check_out_books
end

# New 1 and 2 of 6
get '/books/add_new_book' do
  @book = Book.new
  erb :add_new_book
end

post '/books' do
  @book = Book.new(params)
  if @book.save
    redirect to("/books/list_of_books")
  else
    erb :add_new_book
  end
end

# Index 3 of 6
get '/books/list_of_books' do
  @books = Book.all
  erb :list_of_books
end

# Edit 4 and 5 of 6
get '/books/:id/edit_book' do
    @book = Book.find_by_id(params['id'])
  erb :edit_book
end

post '/books/:id' do
  @book = Book.find_by_id(params['id'])
  if @book.update_attributes(title: params['title'],
      author: params['author'], isbn: params['isbn'])
    redirect to("/books/#{@book.id}")
  else
    erb :edit_book
  end
end

# Show 6 of 6
get '/books/:id' do
  @books = Book.find_by_id(params['id'])
  erb :id_book
end

######################################################### Staff Members
#   Staff Members         ############################### Staff Members
get '/staff_members' do
  erb :staff_members_menu
end

# New 1 and 2 of 6
get '/staff_members/add_new_staff_member' do
  @staff_member = Staff_member.new
  erb :add_new_staff_member
end

post '/staff_members' do
  @staff_member = Staff_member.new(params)
  if @staff_member.save
    redirect to("/staff_members/list_of_staff_members")
  else
    erb :add_new_staff_member
  end
end

# Index 3 of 6
get '/staff_members/list_of_staff_members' do
  @staff_members = Staff_member.all
  erb :list_of_staff_members
end

# Edit 4 and 5 of 6
get '/staff_members/:id/edit_staff_member' do
    @staff_member = Staff_member.find_by_id(params['id'])
  erb :edit_staff_member
end

post '/staff_members/:id' do
  @staff_member = Staff_member.find_by_id(params['id'])
  if @staff_member.update_attributes(name: params['name'],
      email: params['email'])
    redirect to("/staff_members/#{@staff_member.id}")
  else
    erb :edit_staff_member
  end
end

# Show 6 of 6
get '/staff_members/:id' do
  @staff_members = Staff_member.find_by_id(params['id'])
  erb :id_staff_member
end

# Yet to be implemented
get '/staff_members/add_new_staff_member' do
  erb :add_new_staff_member
end

get '/staff_members/edit_staff_member' do
  erb :edit_staff_member
end

######################################################### Patrons
#   Patrons               ############################### Patrons
get '/patrons' do
  erb :patrons_menu
end

get '/patrons/list_of_patrons' do
  erb :list_of_patrons
end

get '/patrons/add_new_patron' do
  erb :add_new_patron
end

get '/patrons/edit_patron' do
  erb :edit_patron
end

#  binding.pry
