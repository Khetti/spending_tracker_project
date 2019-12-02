require("sinatra")
require("sinatra/contrib/all")
require("pry")
require_relative("../models/transaction.rb")
require_relative("../models/tag.rb")
require_relative("../models/merchant.rb")
also_reload("../models/*")

# INDEX
get '/transactions' do
  @transactions = Transaction.all()
  erb (:"transactions/index")
end

# SHOW
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end

# NEW
get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"transactions/new")
end

# CREATE
post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save()
  redirect to("/transactions")
end

# EDIT
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id])
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"transactions/edit")
end

# UPDATE
post '/transactions/:id' do
  Transaction.new(params).update()
  redirect to('/transactions')
end

# DESTROY
post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to("/transactions")
end
