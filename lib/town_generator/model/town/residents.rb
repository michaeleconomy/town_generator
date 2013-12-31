class TownGenerator::Town
  def families
    self[:families] ||= []
  end
  
  def residents
    families.collect(&:members).flatten
  end
  
  def single_residents
    residents.find_all{|r| r.single?}
  end

  def population
    residents.size
  end
end