class TownGenerator::PersonGenerator < TownGenerator::Generator
  def self.go(family)
    p = TownGenerator::Person.new
    p[:last_name] = family.name
    p[:gender] = rand_gender
    p[:first_name] = TownGenerator::NameGenerator.first(p[:gender])
    p
  end
  
  def self.rand_gender
    rand(2) == 1 ? TownGenerator::Person::MALE : TownGenerator::Person::FEMALE
  end
end