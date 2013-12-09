module Enumerable
  def sum
    reduce(:+)
  end
  
  def pick_rand
    self[rand(size)]
  end
end