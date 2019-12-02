require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/tag.rb")
also_reload("../models/*")

# INDEX
get '/merchants' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end

# NEW
get '/merchants/new' do
  erb(:"merchants/new")
end

# CREATE
post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save()
  redirect to '/merchants'
end
