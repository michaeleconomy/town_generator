# TODOs
# Hp
# Ac
# Income
# Attack
# Love interest
# Other motivations
class TownGenerator::Person < TownGenerator::Model

  def first_name
    self[:first_name]
  end
  
  def last_name
    self[:last_name]
  end
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def birthday
    self[:birthday]
  end
  
  # TODO - this is broken for leapyears...
  def age
    (seconds_old / (365 * TownGenerator::SECONDS_IN_DAY)).floor
  end
  
  def town
    self[:town]
  end
  
  def seconds_old
    town.time - birthday
  end

  def inspect
    "{:name => '#{name}', :age => '#{age}', " +
      ":job => '#{job.inspect}', :residence => '#{residence.inspect}', " +
      ":workplace => '#{workplace.inspect}'}"
  end
end
