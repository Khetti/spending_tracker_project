require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :type

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @type = details['type']
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def save()
    sql = "INSERT INTO tags
    (
      type
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@type]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  # returns all tags for use in views
  def self.all()
    sql = "SELECT * FROM tags;"
    results = SqlRunner.run(sql)
    return results.map{ |tag| Tag.new(tag) }
  end

  # returns all tags matching a specific id
    def self.find(id)
      sql = "SELECT * FROM tags
      WHERE id = $1;"
      values = [id]
      results = SqlRunner.run(sql, values)
      return Tag.new(results.first)
    end

end
