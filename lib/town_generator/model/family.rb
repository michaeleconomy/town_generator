# Family
# name
# Income
# Location
# Race
# Hair color
# Skin tone
# heritage (what city they're from)
# residence

class TownGenerator::Family < TownGenerator::Model
  def name
    self[:name]
  end
  def members
    self[:members] ||= []
  end
end