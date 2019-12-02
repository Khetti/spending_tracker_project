require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/merchant.rb")
also_reload("../models/*")

get '/tags' do
  @tags = Tag.all()
  erb (:"tags/index")
end
