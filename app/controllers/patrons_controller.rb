######################################################### Patrons
#   Patrons               ############################### Patrons
get '/patrons' do
  erb :"patrons/patrons_menu"
end

# New 1 and 2 of 6
get '/patrons/add_new_patron' do
  @patron = Patron.new
  erb :"patrons/add_new_patron"
end

post '/patrons' do
  @patron = Patron.new(params)
  if @patron.save
    redirect to("/patrons/list_of_patrons")
  else
    erb :"patrons/add_new_patron"
  end
end

# Index 3 of 6
get '/patrons/list_of_patrons' do
  @patrons = Patron.all
  erb :"patrons/list_of_patrons"
end

# Edit 4 and 5 of 6
get '/patrons/:id/edit_patron' do
    @patron = Patron.find_by_id(params['id'])
  erb :"patrons/edit_patron"
end

post '/patrons/:id' do
  @patron = Patron.find_by_id(params['id'])
  if @patron.update_attributes(name: params['name'],
      email: params['email'])
    redirect to("/patrons/#{@patron.id}")
  else
    erb :"patrons/edit_patron"
  end
end

# Show 6 of 6
get '/patrons/:id' do
  @patrons = Patron.find_by_id(params['id'])
  erb :"patrons/id_patron"
end
