class RandTester
  
  def self.go
    test("x") {rand}
    test("x^2") {rand**2}
    test("sqrt(x)") {Math.sqrt(rand)}
    test("(Math.log(2+rand*2) / Math.log(2)) -1") {(Math.log(2+rand*2) / Math.log(2)) -1}
    test("Math.sin(rand*Math::PI)") {Math.sin(rand*Math::PI)}
    test("(rand-rand).abs") {(rand-rand).abs}
    test("(rand+rand)/2") {(rand+rand)/2}
  end
  
  def self.test(name)
    a = []
    10000.times do
      a << yield.floor_to(1)
    end
    
    puts "\n#{name}"
    Histogram.go(a, false)
  end
  
end