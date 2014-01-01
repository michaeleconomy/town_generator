# Family
# name
# Income
# Location
# Race
# Hair color
# Skin tone
# heritage (where they're from)
# residence

#TODO - this class really doesn't make any sense...
class TownGenerator::Family < TownGenerator::Model
  def name
    self[:name]
  end
  def members
    self[:members] ||= []
  end
end