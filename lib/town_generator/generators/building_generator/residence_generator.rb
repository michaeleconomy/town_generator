class TownGenerator::ResidenceGenerator < TownGenerator::BuildingGenerator
  def self.generate_residences(t)
    t.families.each do |f|
      if homeless?(f)
        puts "the #{f.name} family is homeless"
        next
      end
      r = generate_residence(t)
      f.members.each do |m|
        m.move_in(r)
      end
      puts "the #{f.name} family lives at #{r.address}"
    end
  end
  
  HOMELESS_CHANCE = 0.1
  
  def self.homeless?(f)
    return false if f.size > 1
    
    return false if f.members.first.job
    
    rand < HOMELESS_CHANCE 
  end
  

  def self.generate_residence(t)
    generate_building(t, TownGenerator::Building::RESIDENCE)
  end
end
