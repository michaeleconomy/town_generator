class TownGenerator::PersonGenerator < TownGenerator::Generator
  def self.go(family)
    p = TownGenerator::Person.new
    p[:last_name] = family.name
    p[:gender] = rand_gender
    p[:first_name] = TownGenerator::NameGenerator.first(p[:gender])
    p[:age] = rand_age
    p
  end
  
  def self.rand_gender
    rand(2) == 1 ? TownGenerator::Person::MALE : TownGenerator::Person::FEMALE
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