class TownGenerator::Generator
    
  # randomly choose one of the inputs
  def self.choose_one(a)
    a[rand(a.size)]
  end
  
  # input - an array of arrays where the inner arrays contain two elements
  # first element - item being chosen
  # second element - integer likelyhood of this element winning
  # example:
  # choose_with_probabilities [["bob", 1],["fred", 3]]
  # fred is 3 times more likely to win than bob
  def self.choose_with_probabilities(a)
    total_prob = a.collect(&:last).sum
    r = rand(total_prob)
    a.each do |item, prob|
      r -= prob
      if r < 0
        return item
      end
    end
  end
end
