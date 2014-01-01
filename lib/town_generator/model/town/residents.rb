class TownGenerator::Town
  def families
    # TODO remove this, or make it derived
    self[:families] ||= []
  end
  
  def residents
    self[:residents] ||= []
  end
  
  def single_residents
    residents.find_all{|r| r.single?}
  end

  def population
    residents.size
  end
  
  def deceased
    self[:deceased] ||= []
  end
end