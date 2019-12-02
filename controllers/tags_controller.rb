require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/merchant.rb")
also_reload("../models/*")

# INDEX
get '/tags' do
  @tags = Tag.all()
  erb (:"tags/index")
end

# NEW
get '/tags/new' do
  erb(:"tags/new")
end

# CREATE
post '/tags' do
  @tag = Tag.new(params)
  @tag.save()
  redirect to '/tags'
end
