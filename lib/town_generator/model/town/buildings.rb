class TownGenerator::Town
  def buildings
    streets.collect(&:buildings).flatten
  end

  def vacant_buildings
    buildings.find_all(&:vacant?)
  end
  
  def shops
    buildings.find_all(&:shop?)
  end
  
  def residences
    buildings.find_all(&:residence?)
  end
  
end