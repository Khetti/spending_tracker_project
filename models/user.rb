require_relative('../db/sql_runner')

class User

  attr_reader :id, :budget

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @budget = details['budget']
  end

  def self.delete_all()
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO users
    (
      budget
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@budget]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE users
    SET budget = $1
    WHERE id = $2;"
    values = [@budget, @id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM users
    WHERE id = $1;"
    values = [id]
    results = SqlRunner.run(sql, values)
    return User.new(results.first)
  end

  def report_budget()
    return @budget
  end

end
