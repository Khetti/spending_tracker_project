require("sinatra")
require("sinatra/contrib/all")
require_relative("controllers/users_controller.rb")
require_relative("controllers/merchants_controller.rb")
require_relative("controllers/tags_controller.rb")
require_relative("controllers/transactions_controller.rb")

# this is the homepage
get '/' do
  erb(:index)
end
