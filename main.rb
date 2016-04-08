require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

require_relative "lib/book.rb"
require_relative "lib/library.rb"
require_relative "lib/patron.rb"
require_relative "lib/staff_member.rb"

#binding.pry

get '/' do
  erb :main_menu
end

#   Libraries             ############################### Libraries
get '/libraries' do
  erb :libraries_menu
end

get '/libraries/list_of_libraries' do
  erb :list_of_libraries
end

get '/libraries/list_of_staff_members' do
  erb :list_of_libraries
end

get '/libraries/reassign_staff_member' do
  erb :reassign_staff_member
end

get '/libraries/reassign_book' do
  erb :reassign_book
end

get '/libraries/add_new_library' do
  erb :add_new_library
end

get '/libraries/edit_library' do
  erb :edit_library
end

#   Books                 ############################### Books
get '/books' do
  erb :books_menu
end

get '/books/list_of_books' do
  erb :list_of_books
end

get '/books/check_out_books' do
  erb :check_out_books
end


#   Staff Members         ############################### Staff Members
get '/staff_members' do
  erb :staff_members_menu
end

#   Patrons               ############################### Patrons
get '/patrons' do
  erb :patrons_menu
end
