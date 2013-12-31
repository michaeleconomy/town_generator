class TownGenerator::VacantBuildingGenerator < TownGenerator::BuildingGenerator
  def self.generate_vacant_buildings(t)
    number_of_vacant_buildings(t).times do
      b = generate_building(t)
      puts "vacant building #{b.address} generated"
    end
  end

  def self.number_of_vacant_buildings(t)
    rand((t.buildings.size / 5) + 1)
  end
end