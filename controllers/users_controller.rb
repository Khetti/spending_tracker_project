require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/user.rb")
also_reload("../models/*")
