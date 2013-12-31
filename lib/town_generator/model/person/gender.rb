class TownGenerator::Person < TownGenerator::Model
  MALE = "male"
  FEMALE = "female"
  
  def gender
    self[:gender]
  end
  
  def female?
    gender == FEMALE
  end
  
  def male?
    gender == MALE
  end
end