class TownGenerator::Street < TownGenerator::Model
  
  def town
    self[:town]
  end
  def name
    self[:name]
  end
  
  def cross_streets
    self[:cross_streets] ||= []
  end
  
  def buildings
    self[:buildings] ||= []
  end
  
  def highest_number
    buildings.collect(&:number).max || 0
  end
  
  def next_number
    highest_number + 1
  end
  
  def length
    self[:length]
  end
  
  def inspect
    "#{name}"
  end
end