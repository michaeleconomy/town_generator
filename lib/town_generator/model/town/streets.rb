class TownGenerator::Town
  def streets
    self[:streets] ||= []
  end
end