require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/user.rb")
also_reload("../models/*")

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
