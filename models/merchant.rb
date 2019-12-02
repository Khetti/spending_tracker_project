require_relative('../db/sql_runner')

class Merchant

  attr_reader :id, :name

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO merchants
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  # returns all merchants for use in views
  def self.all()
    sql = "SELECT * FROM merchants;"
    results = SqlRunner.run(sql)
    return results.map{ |merchant| Merchant.new(merchant) }
  end

end
