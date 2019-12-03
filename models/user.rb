require_relative('../db/sql_runner')

class User

  attr_reader :budget

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @budget = details['budget']
  end

end
