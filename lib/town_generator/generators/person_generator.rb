class TownGenerator::PersonGenerator < TownGenerator::Generator
  def self.go(family, town)
    p = generate_blank
    
    p[:birthday] = rand_birthday
    p[:last_name] = family.name
    p[:family] = family
    p
  end
  
  def self.make_baby(mother)
    p = generate_blank(mother.town)
    
    p[:birthday] = TownGenerator::DateGenerator.rand_day_in_year
    p[:last_name] = mother.last_name
    p[:family] = mother.family
    p
  end
  
  def self.generate_blank(town)
    p = TownGenerator::Person.new
    p[:gender] = rand_gender
    p[:town] = town
    town.residents << p
    p[:first_name] = TownGenerator::NameGenerator.first(p[:gender])
    p
  end
  
  def self.rand_gender
    rand(2) == 1 ? TownGenerator::Person::MALE : TownGenerator::Person::FEMALE
  end
  
  def self.rand_birthday
    TownGenerator::DateGenerator.rand_day_for_age(rand_age)
  end
  
  # https://docs.google.com/spreadsheet/ccc?key=0Apugr9CiyRI7dDRZYjBXUlpQVmFmN2hacWplcS1HNGc
  AGE_DISTRIBUTION = [
    [0 , 20110],
    [5 , 20416],
    [10, 20605],
    [15, 21239],
    [20, 21878],
    [25, 20893],
    [30, 20326],
    [35, 19140],
    [40, 20787],
    [45, 21583],
    [50, 22372],
    [55, 20470],
    [60, 17501],
    [65, 13599],
    [70, 9784 ],
    [75, 7331 ],
    [80, 5786 ],
    [85, 5006 ]]
  
  def self.rand_age
    TownGenerator::Generator::choose_with_probabilities(AGE_DISTRIBUTION) + rand(5)
  end
end