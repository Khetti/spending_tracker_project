require_relative('../db/sql_runner')

class User

  attr_reader :budget

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

end
