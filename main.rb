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

get '/libraries' do
  erb :libraries_menu
end

get '/books' do
  erb :books_menu
end

get '/staff_members' do
  erb :staff_members_menu
end

get '/patrons' do
  erb :patrons_menu
end
