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
  
  def age
    days_old / 365
  end
  
  def days_old
    TownGenerator::Date.current - birth_day
  end

  def inspect
    "{:name => '#{name}', :age => '#{age}', " +
      ":job => '#{job.inspect}', :residence => '#{residence.inspect}', " +
      ":workplace => '#{workplace.inspect}'}"
  end
end
