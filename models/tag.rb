require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :type

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @type = details['type']
  end
  
end
