class TownGenerator::Person < TownGenerator::Model
  def job
    self[:job]
  end

  def workplace
    self[:workplace]
  end
end