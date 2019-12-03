require_relative("../models/merchant.rb")
require_relative("../models/tag.rb")
require_relative("../models/transaction.rb")
require_relative("../models/user.rb")
require("pry")

Transaction.delete_all()
Merchant.delete_all()
Tag.delete_all()
User.delete_all()

merchant1 = Merchant.new({
  "name" => "Scotrail"
})
merchant1.save()

merchant2 = Merchant.new({
  "name" => "Sainsburys"
})
merchant2.save()

merchant3 = Merchant.new({
  "name" => "Cineworld"
})
merchant3.save()

merchant4 = Merchant.new({
  "name" => "Nationwide"
})
merchant4.save()

merchant5 = Merchant.new({
  "name" => "Games Workshop"
})
merchant5.save()

tag1 = Tag.new({
  "type" => "Travel"
})
tag1.save()

tag2 = Tag.new({
  "type" => "Groceries"
})
tag2.save()

tag3 = Tag.new({
  "type" => "Entertainment"
})
tag3.save()

tag4 = Tag.new({
  "type" => "Bills"
})
tag4.save()

tag5 = Tag.new({
  "type" => "Hobby & Interest"
  })
tag5.save()

transaction1 = Transaction.new({
  "amount" => 19.99,
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "timestamp" => "2019-12-01 09:32:08 +0000"
})
transaction1.save()

transaction2 = Transaction.new({
  "amount" => 23.36,
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id,
  "timestamp" => "2019-11-30 13:37:54 +0000"
})
transaction2.save()

transaction3 = Transaction.new({
  "amount" => 10.99,
  "merchant_id" => merchant3.id,
  "tag_id" => tag3.id,
  "timestamp" => "2019-12-02 17:41:22 +0000"
})
transaction3.save()

transaction4 = Transaction.new({
  "amount" => 320.72,
  "merchant_id" => merchant4.id,
  "tag_id" => tag4.id,
  "timestamp" => Time.now()
})
transaction4.save()

user1 = User.new({
  "budget" => 0.00
})
user1.save()

binding.pry
nil
