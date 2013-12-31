class TownGenerator::Person < TownGenerator::Model
  def cause_of_death
    self[:cause_of_death]
  end
  
  def dead?
    self[:died_at] <= TownGenerator::Date.current
  end
  
  def alive?
    born? && !dead?
  end
  
  def born?
    birthday >= TownGenerator::Date.current
  end
end