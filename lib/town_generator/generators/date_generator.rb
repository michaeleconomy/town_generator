class TownGenerator::DateGenerator < TownGenerator::Generator
  def self.rand_day_in_year
    range = TownGenerator::Date.current.leap? ? 366 : 365
    @current_date + rand(range)
  end
  
  
  def self.rand_day_for_age(age, town)
    days_age = rand(365) + 365 * age
    town.time - days_age * TownGenerator::SECONDS_IN_DAY
  end
end