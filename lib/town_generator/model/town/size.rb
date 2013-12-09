class TownGenerator::Town::Size
  THORP = "thorp"
  HAMLET = "hamlet"
  VILLAGE = "village"
  SMALL_TOWN = "small town"
  LARGE_TOWN = "large town"
  SMALL_CITY = "small city"
  LARGE_CITY = "large city"
  METROPOLIS = "metropolis"

  SIZES_ODDS = [[THORP, 10], [HAMLET, 10], [VILLAGE, 20], [SMALL_TOWN, 20], [LARGE_TOWN, 15], [SMALL_CITY, 10], [LARGE_CITY, 4], [METROPOLIS, 1]]
  
  SIZE_POPULATION_LIMITS = [
    [ THORP, [20, 80]],
    [ HAMLET, [81, 400]],
    [ VILLAGE, [401, 900]],
    [ SMALL_TOWN, [901, 2000]],
    [ LARGE_TOWN, [2001, 5000]],
    [ SMALL_CITY, [5001, 12000]],
    [ LARGE_CITY, [12001, 25000]],
    [ METROPOLIS, [25000, 150000]]
  ]

  
end