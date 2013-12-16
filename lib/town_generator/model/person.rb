
# Person
# name
# Hp
# Ac
# Income
# Attack
# Family
# Age
# profession
# Love interest
# Other motivations
# residence


class TownGenerator::Person < TownGenerator::Model
  MALE = "male"
  FEMALE = "female"
  
  def gender
    self[:gender]
  end
  
  def age
    self[:age]
  end
end
