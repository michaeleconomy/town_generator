# Seed
# Name
# Population
# Number of families
# Racial distribution
# Gdp
# Average income
# Number of homes
# Number of stores
# public buildings
# Type of government/Power center
# Notable people
# Problems

class TownGenerator::Town < TownGenerator::Model
  # def size
  #   self[:size]
  # end
  
  def inspect
    "{:residents => #{residents.inspect}}"
  end
end
