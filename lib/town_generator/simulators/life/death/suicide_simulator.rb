# 
# Breakdown by Age Groups
# 
#                              (Rates Per 100,000)
#  
# Age       1990 1991 1992 1993 1994 1995 1996 1997 1998 1999 2000 2001 
# 
# 5-14       0.8  0.7  0.9  0.9  0.9  0.9  0.8  0.8  0.8  0.6  0.8  0.7 
# 15-24     13.2 13.1 13.0 13.5 13.8 13.3 12.0 11.4 11.1 10.3 10.4  9.9 
# 25-34     15.2 15.2 14.5 15.1 15.4 15.4 14.5 14.3 13.8 13.5 12.8 12.8 
# 35-44     15.3 14.7 15.1 15.1 15.3 15.2 15.5 15.3 15.4 14.4 14.6 14.7 
# 45-54     14.8 15.5 14.7 14.5 14.4 14.6 14.9 14.7 14.8 14.2 14.6 15.2 
# 55-64     16.0 15.4 14.8 14.6 13.4 13.3 13.7 13.5 13.1 12.4 12.3 13.1 
# 65-74     17.9 16.9 16.5 16.3 15.3 15.8 15.0 14.4 14.1 13.6 12.6 13.3 
# 75-84     24.9 23.5 22.8 22.3 21.3 20.7 20.0 19.3 19.7 18.3 17.7 17.4 
# 85+       22.2 24.0 21.9 22.8 23.0 21.6 20.2 20.8 21.0 19.2 19.4 17.5 
# 65+       20.5 19.7 19.1 19.0 18.1 18.1 17.3 16.8 16.9 15.9 15.3 15.3 
# Total     12.4 12.2 12.0 12.1 12.0 11.9 11.6 11.4 11.3 10.7 10.7 10.8
# 
#                                       Rate Per
#                           Number      100,000     % of Total
# Firearms..................16,869........5.9.........55.1
# All Other Methods.........13,753........4.8.........49.9
# Hanging or Suffocation.....6,198........2.2.........20.2
# Poisoning..................5,191........1.8.........17.0
# Falls........................651........0.2..........2.1
# Cutting / Pieercing..........458........0.2..........1.5
# Drowning.....................339........0.1..........1.1
# Fire.........................147........0.1..........0.5
# 
#                                              Rate Per
#                    Number        Per Day      100,000    % of Deaths    
# Total .............30,622..........83.9.........10.8..........1.3 
# Males .............24,672..........67.6.........17.6..........2.1 
# Females.............5,950..........16.3..........4.1..........0.5

class TownGenerator::SuicideSimulator
  def self.simulate(town)
    town.residents.each do |r|
      simulate_suicude(r)
    end
  end
  SUICIDE_ODDS_MODIFIER_BY_AGE = [
    [4, 0.0],
    [14, 0.08],
    [64, 1.0],
    [1000, 2.0]
  ]
  
  BASE_ODDS = 0.0001
  
  def self.simulate_suicude(person)
    if rand < suicide_odds(person)
      person.die(TownGenerator::DateGenerator.rand_day_in_year, "suicide")
    end
  end
  
  def self.suicide_odds(person)
    BASE_ODDS *
      odds_by_age(SUICIDE_ODDS_MODIFIER_BY_AGE, person.age) *
      suicide_odds_gender(person.gender)
  end
  
  def self.suicide_odds_gender(gender)
    if gender == TownGenerator::Person::MALE
      2.036477169968689
    else
      0.49104405133860407
    end
  end
end