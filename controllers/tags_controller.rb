require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/merchant.rb")
also_reload("../models/*")