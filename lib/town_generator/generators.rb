class TownGenerator::Generator
  
  def self.load_file(fname)
    path = File.expand_path("../../../data/#{fname}", __FILE__)
    File.read(path)
  end
  
  # input - an array of arrays where the inner arrays contain two elements
  # first element - item being chosen
  # second element - integer likelyhood of this element winning
  # example:
  # choose_with_probabilities [["bob", 1],["fred", 3]]
  # fred is 3 times more likely to win than bob
  def self.choose_with_probabilities(a)
    total_prob = a.collect(&:last).sum
    r = rand * total_prob
    a.each do |item, prob|
      r -= prob
      if r < 0
        return item
      end
    end
  end
  
  def self.choose_with_probabilities_multi(a, count)
    total_prob = a.collect(&:last).sum
    r = rand * total_prob
    results = []
    a.delete_if do |item, prob|
      break if results.size >= count
      r -= prob
      if r < 0
        results << item
        true
      else
        false
      end
    end
    results
  end
  
  
  def self.probability_by_age(probabilities, age)
    probabilities.each do |max_age, chance|
      if age <= max_age
        return rand < chance
      end
    end
    false
  end
end
