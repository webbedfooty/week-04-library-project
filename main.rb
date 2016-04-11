require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

Dir[File.dirname(__FILE__) + '/app/*/*.rb'].each {|file| require file }

get '/' do
  erb :main_menu
end
