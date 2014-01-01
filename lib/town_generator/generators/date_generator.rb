class TownGenerator::DateGenerator < TownGenerator::Generator
  def self.rand_day_in_year
    range = TownGenerator::Date.current.leap? ? 366 : 365
    @current_date + rand(range)
  end

  def self.rand_day_for_age(age)
    days_age = rand(365) + 365 * age
    TownGenerator::Date.current - days_age
  end
end