class TownGenerator::TownGenerator < TownGenerator::Generator
  def self.go
    t = TownGenerator::Town.new
    t[:name] = TownGenerator::NameGenerator.last
    generate_initial_settlers(t, 10000)
    TownGenerator::JobGenerator.new.generate_jobs(t)
    TownGenerator::StreetGenerator.generate_streets(t)
    TownGenerator::BuildingGenerator.generate_buildings(t)
    
    
    #TODO: use simulation to grow town?
    t
  end
  
  def self.generate_initial_settlers(t, desired_population)
    while(t.population < desired_population)
      f = TownGenerator::FamilyGenerator.go
      t.families << f
      puts
    end
  end
end
