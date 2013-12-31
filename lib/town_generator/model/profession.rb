class TownGenerator::Profession < TownGenerator::Model
  def name
    self[:name]
  end
  
  def work_location
    self[:work_location]
  end
  
  def dependencies
    self[:dependencies]
  end
  
  def inspect
    "{#{name}}"
  end
end