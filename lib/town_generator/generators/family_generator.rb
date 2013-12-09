class TownGenerator::FamilyGenerator < TownGenerator::Generator
  def self.go
    f = TownGenerator::Family.new
    f[:name] = TownGenerator::NameGenerator.last
    # f.race
    family_size.times do
      p = TownGenerator::PersonGenerator.go(f)
      f.members << p
      puts "family member #{p.inspect} was generated"
    end
    f
  end
  
  def self.family_size
    choose_with_probabilities([[1, 1], [2,1], [3,2], [4,3], [5,2], [6,1]])
  end
end