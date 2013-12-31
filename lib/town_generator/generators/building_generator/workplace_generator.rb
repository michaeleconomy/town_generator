class TownGenerator::WorkplaceGenerator < TownGenerator::BuildingGenerator
  def self.generate_workplaces(t)
    t.residents.each do |r|
      next unless r.job
      case r.job.work_location
      when "own residence"
        r[:workplace] = r.residence
      when "outside of town"  
      when "around town"
      when "shop/own residence"
        if rand > 0.5
          set_works_from_home(r)
        else
          find_shop(r, t)
        end
      when "shop"  
        find_shop(r, t)
      when "other residence"
        find_other_residence_workplace(r, t)
      else
        raise "unknown work_location: #{r.job.work_location}"
      end
    end
  end
  
  def self.set_works_from_home(r)
    set_workplace(r, r.residence)
  end
  
  def self.set_workplace(r, b)
    r[:workplace] = b
    b.workers << r
    puts "#{r.name} is working at #{b.address}"
  end
  
  def self.find_shop(r, t)
    existing_shops = find_eligible_existing_shops(t, r.job)
    if !existing_shops.empty? && shares_workplace?
      set_workplace(r, existing_shops.pick_rand)
      return
    end
    set_workplace(r, generate_shop(t))
  end
  
  def self.shares_workplace?
    rand > 0.5
  end
  
  def self.find_eligible_existing_shops(t, j)
    t.shops.find_all do |shop|
      shop.workers.first.job == j
    end
  end
  
  def self.find_other_residence_workplace(r, t)
    set_workplace(r, t.residences.pick_rand)
  end
  
  
  def self.generate_shop(t)
    generate_building(t, TownGenerator::Building::SHOP)
  end
end