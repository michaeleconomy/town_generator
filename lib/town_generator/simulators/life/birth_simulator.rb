class TownGenerator::BirthSimulator
  
  def self.simulate(town)
    do_births(town)
    generate_pregnancies(town)
  end
  
  def self.do_births(town)
    pregnant_women(town).each do |mother|
      do_birth(mother)
    end
  end
  
  def self.pregnant_women(town)
    town.residents.find_all{|r| r.pregnant?}
  end
  
  def self.generate_pregnancies(town)
    pregnancy_eligible(town).each do |p|
      if rand_pregnancy(p.age)
        generate_pregnancy(p)
      end
    end
  end
  
  def self.pregnancy_eligible(town)
    town.residents.find_all do |r|
      r.female? && r.married? && !r.pregnant? && alive?
    end
  end
  
  #max_age, likelyhood of pregnancy
  PREGNANCY_CHANCE = [
    [15, 0.1 ],
    [17, 0.2 ],
    [23, 0.3 ],
    [30, 0.4 ],
    [35, 0.1 ],
    [40, 0.05],
    [45, 0.01],
    [60, 0.001]
  ]
  
  def self.rand_pregnancy(age)
    TownGenerator::Generator.probability_by_age(PREGNANCY_CHANCE, age)
  end
  
  def self.generate_pregnancy(mother)
    mother[:pregnant] = {}
    mother[:pregnant][:father] = m.spouse
    mother[:pregnant][:count] = rand_size_of_litter
  end
  
  def self.do_birth(mother)
    father = mother.pregnant[:father]
    mother.pregnant[:count].times do
      have_kid(mother, father)
    end
    mother.delete(:pregnant)
  end
  
  def self.have_kid(mother, father)
    p = TownGenerator::PersonGenerator.make_baby(mother)
    mother.children << p
    father.children << p
    p[:mother] = mother
    p[:father] = father
  end
  
  # http://en.wikipedia.org/wiki/Multiple_birth
  def self.rand_size_of_litter
    r = rand
    if r < 0.00000142
      4
    elsif r < 0.00013
      3
    elsif r < .011
      2
    else
      1
    end
  end
end