class TownGenerator::TownSimulator
  
  def self.simulate(town)
    TownGenerator::Date.advance_year
    TownGenerator::LoveSimulator.simulate(town)
    TownGenerator::LifeSimulator.simulate(town)
    TownGenerator::BuildingSimulator.simulate(town)
    
    # construction/demolition simulator
    # job simulator
  end
end