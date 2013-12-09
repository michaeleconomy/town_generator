class TownGenerator::TownGenerator < TownGenerator::Generator
  def self.go
    t = TownGenerator::Town.new
    t[:name] = TownGenerator::NameGenerator.first
    generate_initial_settlers(t, 100)
    # desired_size = Generate::Town::Size.make
    # desired_population = random_population(desired_size)
    # while(t.population < desired_population)
    #   cycle.go(t)
    # end
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
