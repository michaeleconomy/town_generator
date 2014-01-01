class OddsNormalizer
  def self.normalize(a)
    a = a.collect(&:to_f)
    n = a.size.to_f
    if n <= 1
      return [1]
    end
    output = []
    n.to_i.times do |i|
      output <<
       (a[i]**(n-1)/(a[0...i] + a[(i+1)..-1]).inject(&:*) )**(1/n)
    end
    output
  end
end