require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/tag.rb")
also_reload("../models/*")

# link to page showing all merchants
get '/merchants' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end

get '/merchants/new' do
  erb(:new)
end

post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save()
  redirect to '/merchants'
end
