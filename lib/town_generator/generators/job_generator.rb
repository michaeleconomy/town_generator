require 'csv'
# data file:
# https://docs.google.com/spreadsheet/ccc?key=0Apugr9CiyRI7dGJzTTB2cXR6aTVVY3EwbWwxbHdxcEE
class TownGenerator::JobGenerator < TownGenerator::Generator
  
  def initialize
    @professions = []
    @profession_odds = []
    profession_data = TownGenerator::Generator::load_file("professions/professions.csv")
    CSV.parse(profession_data) do |row|
      begin
        name, rarity, group, dependancies_string, gender, definition, percent, aka_string = row
        dependancies =
          if dependancies_string
            dependancies_string.split
          end
        aka =
          if aka_string
            aka_string.split
          end
        p = TownGenerator::Profession.new
        p[:name] = name
        p[:group] = group
        p[:dependancies] = dependancies
        p[:gender] = gender
        p[:definition] = definition
        p[:percent] = percent
        p[:aka] = aka
        @professions << p
        @profession_odds << [p, (percent.to_f * 1000).to_i]
      rescue => e
        raise "could not parse line '#{row.inspect}': #{e}"
      end
    end
  end
  
  def rand_job
    TownGenerator::Generator::choose_with_probabilities(@profession_odds)
  end
end