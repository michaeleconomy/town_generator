class TownGenerator::Cycle
  AVERAGE_LIFESPAN = 72
  
  LIFETIME_MARRIAGE_CHANCE = 0.9
  
  CYCLE_LENGTH = 1
  
  def self.go(town)
    marriages(town)
    children(town)
    deaths(town)
    # demolition(town)
    # consruction(town)
    # jobs_started(town)
    # jobs_left(town)
  end
  
  
  
  def self.marriages(town)
    unmarried = town.residents.find_all{|r| r.spouse == nil}.group_by(&:gender)
  end
  
  def self.children(town)
    
  end
  
  def self.deaths(town)
    
  end
end