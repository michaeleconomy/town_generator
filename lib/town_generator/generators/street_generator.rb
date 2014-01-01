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
    loop
      new_st = go(t)
      unless street_name_taken(new_st.name, t)
        return new_st
      end
    end
  end
  
  def self.street_name_taken(name, town)
    t.streets.detect{|s| s.name == name}
  end
  
  def self.go(town)
    s = TownGenerator::Street.new
    s[:name] = street_name
    s[:town] = town
    s
  end
  
  def self.street_name
    "#{TownGenerator::NameGenerator.last} #{type_name}"
  end
  
  def self.type_name
    ["street", "alley", "lane", "boulevard", "circle", "road"].pick_rand
  end
end
