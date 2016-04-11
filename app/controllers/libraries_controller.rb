######################################################### Libraries
#   Libraries             ############################### Libraries
get '/libraries' do
  erb :"libraries/libraries_menu"
end

# New 1 and 2 of 6
get '/libraries/add_new_library' do
  @library = Library.new
  erb :"libraries/add_new_library"
end

post '/libraries' do
  @library = Library.new(params)
  if @library.save
    redirect to("/libraries/list_of_libraries")
  else
    erb :"libraries/add_new_library"
  end
end

# Index 3 of 6
get '/libraries/list_of_libraries' do
  @libraries = Library.all
  erb :"libraries/list_of_libraries"
end

# Edit 4 and 5 of 6
get '/libraries/:id/edit_library' do
    @library = Library.find_by_id(params['id'])
  erb :"libraries/edit_library"
end

post '/libraries/:id' do
  @library = Library.find_by_id(params['id'])
  if @library.update_attributes(branch_name: params['branch_name'],
      address: params['address'], phone_number: params['phone_number'])
    redirect to("/libraries/#{@library.id}")
  else
    erb :"libraries/edit_library"
  end
end

# Show 6 of 6
get '/libraries/:id' do
    @libraries = Library.find_by_id(params['id'])
  erb :"libraries/id_library"
end
