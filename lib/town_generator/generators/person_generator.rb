class TownGenerator::PersonGenerator < TownGenerator::Generator
  def self.go(family)
    p = TownGenerator::Person.new
    p[:last_name] = family.name
    p[:first_name] = TownGenerator::NameGenerator.first
    p
  end
end