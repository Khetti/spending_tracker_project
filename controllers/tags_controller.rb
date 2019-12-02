require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/merchant.rb")
also_reload("../models/*")

# link to page showing all tags
get '/tags' do
  @tags = Tag.all()
  erb (:"tags/index")
end
