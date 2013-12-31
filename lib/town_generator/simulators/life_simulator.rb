class TownGenerator::LifeSimulator
  def self.simulate(town)
    TownGenerator::BirthSimulator.simulate(town)
    TownGenerator::DeathSimulator.simulate(town)
  end
end