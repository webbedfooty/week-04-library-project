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

###############################
#   Libraries             ############################### Libraries
get '/libraries' do
  erb :libraries_menu
end

get '/libraries/list_of_staff_members' do
  erb :list_of_staff_members
end

get '/libraries/reassign_staff_member' do
  erb :reassign_staff_member
end

get '/libraries/reassign_book' do
  erb :reassign_book
end

# New
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

# Index
get '/libraries/list_of_libraries' do
  @libraries = Library.all
  erb :list_of_libraries
end

# Edit
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

# Show
get '/libraries/:id' do
    @libraries = Library.find_by_id(params['id'])
  erb :id_library
end


###############################
#   Books                 ############################### Books
get '/books' do
  erb :books_menu
end

get '/books/check_out_books' do
  erb :check_out_books
end

get '/books/add_new_book' do
  erb :add_new_book
end

get '/books/edit_book' do
  erb :edit_book
end

# Show
get '/book/:id' do
  @books = Book.find_by_id(params['id'])
  erb :id_book
end

# Index
get '/books/list_of_books' do
  @books = Book.all
  erb :list_of_books
end

###############################
#   Staff Members         ############################### Staff Members
get '/staff_members' do
  erb :staff_members_menu
end

get '/staff_members/add_new_staff_member' do
  erb :add_new_staff_member
end

get '/staff_members/edit_staff_member' do
  erb :edit_staff_member
end

###############################
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
