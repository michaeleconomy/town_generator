class TownGenerator::Person < TownGenerator::Model
  
  def crimes
    self[:crimes] ||= []
  end
  
  def criminal
    !crimes.empty?
  end
  
  def murderer
    crimes.select {|c| c[:type] == :murder}
  end
  
  def victim_history
    self[:victim_history] ||= []
  end
end