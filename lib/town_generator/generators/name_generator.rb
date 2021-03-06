# first
# middle
# additional
# maiden
# last
# nick name
class TownGenerator::NameGenerator < TownGenerator::Generator
  
  def self.load_file(fname)
    super("names/#{fname}").split
  end
  
  LAST_NAMES = load_file("last.txt")
  
  MALE_FIRST_NAMES = load_file("first.male.txt")
  FEMALE_FIRST_NAMES = load_file("first.female.txt")
  
  def self.first(gender)
    array =
      if gender == TownGenerator::Person::MALE
        MALE_FIRST_NAMES
      else
        FEMALE_FIRST_NAMES
      end
    
    array.pick_rand
  end
  
  def self.last
    LAST_NAMES.pick_rand
  end
  
end
