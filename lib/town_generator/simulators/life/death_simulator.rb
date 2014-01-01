class TownGenerator::DeathSimulator
  def self.simulate(town)
    TownGenerator::IllnessSimulator.simulate(town)
    TownGenerator::MurderSimulator.simulate(town)
    TownGenerator::AccidentalDeathSimulator.simulate(town)
    TownGenerator::SuicideSimulator.simulate(town)
  end
end