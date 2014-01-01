class TownGenerator::LoveSimulator
  
  def self.simulate(town)
    do_marriages(t)
  end
  
  #the likelyhood of a single person to get married within a certain year
  #max_age - yearly-odds
  MARRIAGE_LIKELYHOOD_BY_AGE = [
    [15, 0.002 ],
    [18, 0.02  ],
    [24, 0.03  ],
    [35, 0.04  ],
    [40, 0.01  ],
    [50, 0.005 ],
    [60, 0.0008],
    [99, 0.0001]
  ]
  
  def self.random_marriage?(age)
    TownGenerator::Generator.probability_by_age(MARRIAGE_LIKELYHOOD_BY_AGE, age)
  end
  
  def self.randomize_marriages(people)
    people.find_all do |person|
      random_marriage?(person.age)
    end
  end
  
  def self.do_marriages(town)
    eligible_people = marriage_eligible_residents(town)
    candidates = randomize_marriages(eligible_people)
    
    candidates.sort_by(&:age) #TODO - this is not random enough
    grooms, brides = split_up_genders(candidates)
    
    grooms.each do |groom|
      bride = brides.pop
      if !bride
        break
      end
      marry(bride, groom, town)
    end
  end
  
  def self.marry(bride, groom, town)
    if bride.spouse
      raise "bride (#{bride.name}) is already married!"
      return false
    end
    
    if groom.spouse
      raise "groom (#{groom.name}) is already married!"
      return false
    end
    date = TownGenerator::DateGenerator.rand_day_in_year
    bride[:maiden_name] = bride.last_name
    bride[:last_name] = groom.last_name
    bride[:spouse] = groom
    groom[:spouse] = bride
    bride[:married_at] = date
    groom[:married_at] = date
    
    find_new_house_and_move(bride, groom, town)
    puts "#{bride.name} and #{groom.name} just got married!"
    true
  end
  
  def self.find_new_house_and_move(bride, groom, town)
    house = find_house(bride, groom, town)
    people_to_move_after_marriage(bride, groom).each do |p|
      p.move_to(house)
    end
  end
  
  def self.find_house(bride, groom, town)
    if !groom.lives_with_non_descendant_housemates?
      return groom.residence
    end
    
    if !bride.lives_with_non_descendant_housemates?
      return bride.residence
    end
    
    house = groom.residence
    
    house ||= bride.residence
    
    if will_find_new_house
      house = find_new_house(town)
    end
    
    house
  end
  
  def self.will_find_new_house(groom)
    groom.lives_with_non_descendant_housemates? && rand > 0.5
  end
  
  def self.find_new_house(town)
    vacant = town.vacant_buildings.pick_rand
    if vacant && rand(2) == 0
      return vacant
    end
    
    TownGenerator::ResidenceGenerator.generate_residence(town)
  end
  
  def self.people_to_move_after_marriage(bride, groom)
    people = [bride, groom]
    people += bride.descendant_housemates
    people += groom.descendant_housemates
    people
  end
  
  def self.split_up_genders(people)
    people.group_by(&:gender).collect(&:last)
  end
  
  def self.marriage_eligible_residents(town)
    singles = town.single_residents
    age_appropriate_marriage(singles)
  end
  
  MIN_MARRIAGE_AGE = 12
  
  def self.filter_age_appropriate_marriage(residents)
    residents.find_all{|r| r.age >= MIN_MARRIAGE_AGE}
  end
end