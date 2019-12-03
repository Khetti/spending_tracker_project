require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/user.rb")
also_reload("../models/*")

# INDEX
get '/users' do
  @users = User.all()
  erb (:"users/index")
end

# NEW
get '/users/new' do
  erb(:"users/new")
end

# CREATE
post '/users' do
  @user = User.new(params)
  @user.save()
  redirect to '/users'
end

# EDIT
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb(:"users/edit")
end

# UPDATE
post '/users/:id' do
  User.new(params).update()
  redirect to('/transactions')
end
