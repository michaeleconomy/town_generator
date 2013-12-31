class TownGenerator::BuildingSimulator
  
  def self.simulate(town)
    TownSimulator::ConstructionSimulator.simulate(town)
  end
  
end
