# Name
# Type - single/dual/etc
# Owner
#
# STORE
# Cash on hand
# Overall pricing rule
# Inventory (depends on type)
# Pricing
class TownGenerator::Building < TownGenerator::Model
  RESIDENCE = "residence"
  SHOP = "shop"
  MIXED = "mixed"
  
  USES = [RESIDENCE, SHOP, MIXED]
  
  def use
    self[:use]
  end
  
  def shop?
    use == SHOP || mixed?
  end
  
  def mixed?
    use == MIXED
  end
  
  def residence?
    use == RESIDENCE || mixed?
  end
  
  def owner
    self[:owner]
  end
  
  def inhabitants
    self[:inhabitants] ||= []
  end
  
  def workers
    self[:workers] ||= []
  end
  
  def vacant
    inhabitants.empty? && workers.empty?
  end
  
  def address
    "#{number} #{street.name}"
  end
  
  def street
    self[:street]
  end
  
  def number
    self[:number]
  end
  
  def inspect
    "{:address => '#{address}'}"
  end
  
end