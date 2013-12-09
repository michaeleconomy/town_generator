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
  def size
    self[:size]
  end
  
  def population
    residents.size
  end

  def homeless_percentage
    0.01
  end

  def percentage_employable
    0.5
  end

  def vacant_buildings
    raise "not implemented"
  end

end
