require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :amount, :merchant_id, :tag_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @amount = details['amount']
    @merchant_id = details['merchant_id'].to_i
    @tag_id = details['tag_id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO transactions
    (
      amount,
      merchant_id,
      tag_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id;"
    values = [@amount, @merchant_id, @tag_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  # returns all transactions for use in views
  def self.all()
    sql = "SELECT * FROM transactions;"
    results = SqlRunner.run(sql)
    return results.map{ |transaction| Transaction.new(transaction) }
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
