class TownGenerator::Person < TownGenerator::Model
  def cause_of_death
    self[:cause_of_death]
  end
  
  def dead?
    self[:died_at] <= TownGenerator::Date.current
  end
  
  def alive?
    born? && !dead?
  end
  
  def born?
    birthday >= TownGenerator::Date.current
  end
  
  def die(date, cause)
    self[:died_at] = date
    self[:cause_of_death] = cause
    end_marriage
    move_out
    leave_job
    #TODO - remove any illnesses
    delete(:pregnant)
    
    town.residents.delete(:self)
    town.deceased << self
  end
end