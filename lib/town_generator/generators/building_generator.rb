class TownGenerator::BuildingGenerator < TownGenerator::Generator
  def self.generate_buildings(t)
    TownGenerator::ResidenceGenerator.generate_residences(t)
    TownGenerator::WorkplaceGenerator.generate_workplaces(t)
    TownGenerator::VacantBuildingGenerator.generate_vacant_buildings(t)
  end
  
  def self.generate_building(t, use = nil)
    b = TownGenerator::Building.new
    set_address(b, t)
    b[:use] = use
    b
  end
  
  def self.set_address(b, t)
    s = t.streets.pick_rand
    b[:street] = s
    b[:number] = s.next_number
    s.buildings << b
  end
end
