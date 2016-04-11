######################################################### Staff Members
#   Staff Members         ############################### Staff Members
get '/staff_members' do
  erb :"staff_members/staff_members_menu"
end

# New 1 and 2 of 6
get '/staff_members/add_new_staff_member' do
  @staff_member = Staff_member.new
  erb :"staff_members/add_new_staff_member"
end

post '/staff_members' do
  @staff_member = Staff_member.new(params)
  if @staff_member.save
    redirect to("/staff_members/list_of_staff_members")
  else
    erb :"staff_members/add_new_staff_member"
  end
end

# Index 3 of 6
get '/staff_members/list_of_staff_members' do
  @staff_members = Staff_member.all
  erb :"staff_members/list_of_staff_members"
end

# Edit 4 and 5 of 6
get '/staff_members/:id/edit_staff_member' do
    @staff_member = Staff_member.find_by_id(params['id'])
  erb :"staff_members/edit_staff_member"
end

post '/staff_members/:id' do
  @staff_member = Staff_member.find_by_id(params['id'])
  if @staff_member.update_attributes(name: params['name'],
      email: params['email'])
    redirect to("/staff_members/#{@staff_member.id}")
  else
    erb :"staff_members/edit_staff_member"
  end
end

# Show 6 of 6
get '/staff_members/:id' do
  @staff_members = Staff_member.find_by_id(params['id'])
  erb :"staff_members/id_staff_member"
end
