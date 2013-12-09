class TownGenerator::Town
  def families
    self[:families] ||= []
  end
  
  def residents
    families.collect(&:members).flatten
  end
end