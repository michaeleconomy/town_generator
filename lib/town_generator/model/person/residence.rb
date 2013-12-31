class TownGenerator::Person < TownGenerator::Model
  
  def residence
    self[:residence]
  end
  
  def move_to(house)
    move_out
    move_in(house)
  end
  
  def homeless?
    !residence
  end
  
  def move_out
    self.residence.delete(self)
    self[:residence] = nil
  end
  
  def move_in(house)
    house.inhabitants << self
    self[:residence] = house
  end
end