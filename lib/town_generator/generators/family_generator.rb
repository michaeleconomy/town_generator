class TownGenerator::FamilyGenerator < TownGenerator::Generator
  def self.go
    f = TownGenerator::Family.new
    f[:name] = TownGenerator::NameGenerator.last
    # f.race
    family_size.times do
      p = TownGenerator::PersonGenerator.go(f)
      f.members << p
      puts "person #{p.name} (age: #{p.age}) was generated"
    end
    f
  end
  
  FAMILY_SIZE_ODDS = [[1, 1], [2,1], [3,2], [4,3], [5,2], [6,1]]
  def self.family_size
    choose_with_probabilities(FAMILY_SIZE_ODDS)
  end
end