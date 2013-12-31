class TownGenerator::Date
  DATE = self.new
  
  def initialize
    @current_date = Date.parse("1-1-1000")
  end
  
  def current
    @current_date
  end
  
  def advance_year
    @current_date = @current_date.next_year
  end
  
  def self.current
    DATE.current
  end
  
  def self.advance_year
    DATE.advance_year
  end
  
  def self.reset_time(string)
    raise "TODO"
  end
end