#TODO - simulate epidemics
class TownGenerator::IllnessSimulator
  def self.simulate(town)
    town.residents.each do |r|
      simulate_fatal_illnesses(r)
    end
  end
  
  def self.simulate_fatal_illnesses(person)
    DISEASES.each do |disease, base_odds, age_modifiers|
      odds = base_odds * odds_by_age(age_modifiers, age)
      if rand < odds
        person.die(TownGenerator::DateGenerator.rand_day_in_year, disease)
      end
    end
  end
  
  CANCER_ODDS_BY_AGE = [
    [10, 0.001],
    [20, 0.01],
    [30, 0.1],
    [40, 1.0],
    [50, 5.0],
    [60, 10.0],
    [70, 10.0],
    [80, 5.0],
    [90, 0.5],
    [110, 0.1],
  ]
  
  CARDIO_ODDS_BY_AGE = [
      [30, 0.001],
      [40, 0.01],
      [50, 1.0],
      [80, 10.0],
      [110, 0.5],
  ]
  
  DISEASES = [
    ["cancer", 0.002, CANCER_ODDS_BY_AGE], #TODO - could generate the type of cancer...
    ["heart disease", 0.002, CARDIO_ODDS_BY_AGE],
    ["stroke", 0.0005, CARDIO_ODDS_BY_AGE]
  ]
end