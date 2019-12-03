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

# SORT
# sorts all transactions by newest to oldest, then returns to index
get '/transactions/sort/new-old' do
  @transactions = Transaction.newest_oldest()
  erb (:"transactions/index")
end

# sorts all transactions by oldest to newest, then returns to index
get '/transactions/sort/old-new' do
  @transactions = Transaction.oldest_newest()
  erb (:"transactions/index")
end

# DESTROY
post '/transactions/:id/delete' do
  Transaction.delete(params[:id])
  redirect to('/transactions')
end

# NEW
get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  @timestamp = Time.now()
  erb(:"transactions/new")
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

# SHOW
get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/show")
end

# CREATE
post '/transactions' do
  transaction = Transaction.new(params)
  transaction.add_time()
  transaction.save()
  redirect to("/transactions")
end
