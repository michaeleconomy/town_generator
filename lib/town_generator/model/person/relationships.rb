class TownGenerator::Person < TownGenerator::Model
  def family
    self[:family]
  end
  
  def house_mates
    return [] unless house_mates
    
    residence.inhabitants - self
  end
  
  def lives_alone?
    residence && house_mates.empty?
  end
  
  def children
    self[:children] ||= []
  end
  
  def father
    self[:father]
  end
  
  def mother
    self[:mother]
  end
  
  def parents
    [mother, father]
  end
  
  def spouse
    self[:spouse]
  end
  
  def married_at
    self[:married_at]
  end
  
  def previous_marriages
    self[:previous_marriages] ||= []
  end
  
  def single?
    spouse.nil?
  end
  
  def married?
    !single?
  end
  
  def end_marriage(recurse = true)
    former_spouse = spouse
    previous_marriages << {:to => former_spouse, :married_at => married_at}
    
    self.delete(:spouse)
    self.delete(:married_at)
    if recurse
      former_spouse.end_marriage(false)
    end
  end
  
  def pregnant?
    !self[:pregnant].nil?
  end
  
  def siblings
    (father.children + mother.children).uniq - self
  end
  
  def descendants
    children + children.collect(&:descendants).flatten
  end
  
  def non_descendant_housemates
    house_mates - descendants
  end

  def descendant_housemates
    house_mates & descendants
  end
  
  def self.lives_with_non_descendant_housemates?
    !non_descendant_housemates.empty?
  end
end
