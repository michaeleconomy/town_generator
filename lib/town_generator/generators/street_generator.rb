class TownGenerator::StreetGenerator < TownGenerator::Generator
  def self.generate_streets(t)
    num_streets_to_generate(t).times do
      add_street(t)
    end
  end
  
  def self.num_streets_to_generate(t)
    rand((t.residents.count / 50) + 1) + 1
  end
  
  
  def self.add_street(t)
    new_st = get_uniquely_named_street(t)
    add_cross_streets(new_st, t)
    t.streets << new_st
    
    puts "#{new_st.name} generated"
  end
  
  def self.add_cross_streets(new_st, t)
    cross_st = t.streets.pick_rand
    if cross_st
      cross_st.cross_streets << new_st
      new_st.cross_streets << cross_st
    end
  end
  
  def self.get_uniquely_named_street(t)
    new_st = go
    while t.streets.detect{|s| s.name == new_st.name}
      new_st = go
    end
    new_st
  end
  
  def self.go
    s = TownGenerator::Street.new
    s[:name] = street_name
    s
  end
  
  def self.street_name
    "#{TownGenerator::NameGenerator.last} #{type_name}"
  end
  
  def self.type_name
    ["street", "alley", "lane", "boulevard", "circle", "road"].pick_rand
  end
end
