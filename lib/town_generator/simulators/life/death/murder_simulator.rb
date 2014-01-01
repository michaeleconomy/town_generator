# http://www.fbi.gov/about-us/cjis/ucr/crime-in-the-u.s/2012/crime-in-the-u.s.-2012/offenses-known-to-law-enforcement/expanded-homicide/expanded_homicide_data_table_10_murder_circumstances_by_relationship_2012.xls

#TODOS
# - particular races could have different murder rates...
# - split up causes of murder (disagreement, serial killer, botched crime, revenge, etc)
class TownGenerator::MurderSimulator
  def self.simulate(town)
    num_murders_to_simulute(town).times do
      simulate_murder(town)
    end
  end
  
  MURDER_RATE = 0.0005
  
  def self.num_murders_to_simulute(town_size)
    #TODO - for small towns, this is effectively locked into 0
    base_count = town_size * MURDER_RATE
    floating_pount_num_murders = ((((rand+rand+rand)/3) + rand**3) * base_count * 1.5)
    remainder = floating_pount_num_murders.modulo(1)
    if rand < remainder
      floating_pount_num_murders += 1
    end
    floating_pount_num_murders.floor
  end
  
  
  def self.simulate_murder(town)
    crime[:victims] = find_victims(town)
    crime[:killers] = find_killers(town, victims)
    crime[:date] = TownGenerator::DateGenerator.rand_day_in_year
    implement = random_implement
    crime[:type] = :murder
    crime[:description] = "murder implement: #{implement}"
    crime[:location] = random_location(town)
    crime[:victims].each do |victim|
      victim.victim_history << crime
      victim.die date, "murder"
    end
  end
  
  def self.random_location(town)
    if rand > 0.5
      town.streets.pick_rand
    else
      town.buildings.pick_rand
    end
  end

  def self.find_victims(town)
    num_victims = rand_num_victims
    town.residents.collect{|r| [r, murder_victim_odds(r)]}
    
    choose_with_probabilities_multi(odds, num_victims)
  end
  
  def self.find_killers(victims, town)
    #TODO - currently a victim can't also be a killer, this could happen
    (town.residents - victims).collect{|r| [r, murder_victim_odds(r)]}

    choose_with_probabilities_multi(odds, rand_num_victims)
  end
  
  def self.killer_odds(person)
    killer_criminal_odds(person) *
      killer_gender_odds(person.gender) *
      killer_age_odds(person.age)
  end
  
  def self.num_victims
    if rand > 0.1
      return 1
    end
    ((rand-rand).abs**6 * 30).ceil + 1
  end
  
  def self.num_killers
    ((rand-rand).abs**4 * 10).ceil
  end
  
  def self.murder_victim_odds(person)
    murder_victim_age_odds(person.age) *
      murder_victim_gender_odds(person.gender) *
      murder_victim_criminal_odds(person)
  end
  
  def self.murder_victim_criminal_odds(person)
    person.criminal? ? 4 : 1
  end
  
  
  def self.killer_criminal_odds(person)
    person.criminal? ? 4 : 1
  end
  
  def self.killer_gender_odds(gender)
    if gender == TownGenerator::Person::MALE
      9
    else
      1
    end
  end
  
  KILLER_ODDS_BY_AGE = [
    [4, 0     ],
    [8, 0.25  ],
    [12, 5    ],
    [16, 81.5 ],
    [19, 426  ],
    [24, 511  ],
    [29, 319  ],
    [34, 233  ],
    [39, 148.6],
    [44, 112.6],
    [49, 97.4 ],
    [54, 76   ],
    [59, 49.8 ],
    [64, 28.4 ],
    [69, 14   ],
    [74, 11   ],
    [99, 3.36 ]
  ]
  
  def self.killer_age_odds(age)
    KILLER_ODDS_BY_AGE.each do |max_age, odds|
      if age <= max_age
        return odds
      end
    end
    0
  end
  
  VICTIM_ODDS_BY_AGE = [			
    [1,  0.011383399],
    [4,  0.00687747 ],
    [8,  0.001897233],
    [12, 0.001284585],
    [16, 0.006442688],
    [19, 0.026376812],
    [24, 0.037343874],
    [29, 0.030229249],
    [34, 0.023462451],
    [39, 0.017407115],
    [44, 0.014909091],
    [49, 0.012252964],
    [54, 0.011747036],
    [59, 0.008173913],
    [64, 0.004869565],
    [69, 0.003541502],
    [74, 0.001849802],
    [99, 0.000856917]
  ]
  
  def self.murder_victim_age_odds(age)
    VICTIM_ODDS_BY_AGE.each do |max_age, odds|
      if age <= max_age
        return odds
      end
    end
    0
  end
  
  def self.murder_victim_gender_odds(gender)
    if gender == TownGenerator::Person::MALE
      0.777
    else
      0.222
    end
  end
  
  IMPLEMENT_ODDS = [
    ["magic", 300],
    ["arrow", 600],
    ["crossbow", 400],
    ["sharp objects", 1589],
    ["blunt objects", 518],
    ["hand to hand", 678],
    ["poison", 120],
    ["explosives", 8],
    ["fire", 85],
    ["drowning", 13],
    ["strangulation", 89],
    ["asphyxiation", 105],
    ["animal", 40],
    ["other", 500]]
  def self.random_implement
    choose_with_probabilities(IMPLEMENT_ODDS)
  end
end