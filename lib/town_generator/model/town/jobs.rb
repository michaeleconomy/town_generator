class TownGenerator::Town
  def jobs
    residents.collect(&:job).compact.uniq
  end
end