require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :amount, :merchant_id, :tag_id, :user_id, :timestamp

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @amount = details['amount']
    @merchant_id = details['merchant_id'].to_i
    @tag_id = details['tag_id'].to_i
    @user_id = details['user_id'].to_i
    @timestamp = details['timestamp']
  end

  def save()
    sql = "INSERT INTO transactions
    (
      amount,
      merchant_id,
      tag_id,
      user_id,
      timestamp
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id;"
    values = [@amount, @merchant_id, @tag_id, @user_id, @timestamp]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  # updates existing transaction
  def update()
    sql = "UPDATE transactions
    SET
    (
      amount,
      merchant_id,
      tag_id,
      user_id
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5;"
    values = [@amount, @merchant_id, @tag_id, @user_id, @id]
    SqlRunner.run(sql, values)
  end

  # returns all transactions for use in views
  def self.all()
    sql = "SELECT * FROM transactions;"
    results = SqlRunner.run(sql)
    return results.map{ |transaction| Transaction.new(transaction) }
  end

  def self.newest_oldest()
    sql = "SELECT * FROM transactions
    ORDER BY timestamp DESC;"
    results = SqlRunner.run(sql)
    return results.map{ |transaction| Transaction.new(transaction) }
  end

  def self.oldest_newest()
    sql = "SELECT * FROM transactions
    ORDER BY timestamp ASC;"
    results = SqlRunner.run(sql)
    return results.map{ |transaction| Transaction.new(transaction) }
  end

  # assigns a Time object to the timestamp property within a new transaction
  def add_time()
    @timestamp = Time.now()
  end

  # return a specific transaction by id
  def self.find(id)
    sql = "SELECT * FROM transactions
    WHERE id = $1"
    values = [id]
    transaction = SqlRunner.run(sql, values)
    result = Transaction.new(transaction.first)
    return result
  end

  # delete a transaction matching an id
  def self.delete(id)
    sql = "DELETE FROM transactions
    WHERE id = $1;"
    values = [id]
    SqlRunner.run(sql,values)
  end

  # delete all transactions; called in seeds.rb
  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.total()
    sql = "SELECT SUM(amount)
    FROM transactions;"
    return SqlRunner.run(sql)[0]['sum']
  end

  # allows access to merchant properties for view purposes
  def merchant()
    sql = "SELECT * FROM merchants
    WHERE id = $1;"
    values = [@merchant_id]
    results = SqlRunner.run(sql,values)
    return Merchant.new(results.first)
  end

  # allows access to merchant properties for view purposes
  def tag()
    sql = "SELECT * FROM tags
    WHERE id = $1;"
    values = [@tag_id]
    results = SqlRunner.run(sql,values)
    return Tag.new(results.first)
  end

end
