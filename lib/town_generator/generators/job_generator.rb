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
        name, rarity, group, dependancies_string, gender, definition, percent, aka_string, work_location, work_location_name = row
        dependancies =
          if dependancies_string
            dependancies_string.split(", ")
          end
        aka =
          if aka_string
            aka_string.split(", ")
          end
        p = TownGenerator::Profession.new
        p[:name] = name
        p[:group] = group
        p[:dependancies] = dependancies
        p[:gender] = gender
        p[:definition] = definition
        p[:percent] = percent
        p[:aka] = aka
        p[:work_location] = work_location
        p[:aka] = work_location_name
        @professions << p
        @profession_odds << [p, (percent.to_f * 1000).to_i]
      rescue => e
        raise "could not parse line '#{row.inspect}': #{e}"
      end
    end
  end
  
  def generate_jobs(town)
    town.residents.each do |r|
      generate_job(r)
    end
  end
  
  
  def generate_job(resident)
    if is_employed(resident)
      resident.job = rand_allowed_job
    end
  end
  
  #[[max_ageX, male probability, female probability]]}
  EMPLOYED_PROBABLILITY = [
    [6,   0.0,  0.0],
    [8,   0.02, 0.02],
    [11,  0.05, 0.05],
    [14,  0.3,  0.2],
    [17,  0.6,  0.5],
    [45,  0.9,  0.7],
    [60,  0.7,  0.7],
    [999, 0.5,  0.5]
  ]
  
  def employed_probability(age, gender)
    is_male = gender == TownGenerator::Person::MALE
    EMPLOYED_PROBABLILITY.each do |max_age, male_probability, female_probability|
      if age < max_age
        return is_male ? male_probability : female_probability
      end
    end
    0.0
  end
  
  def is_employed(resident)
    probability = employed_probability(resident.age, resident.gender)
    rand < probability
  end
  
  def rand_job
    TownGenerator::Generator::choose_with_probabilities(@profession_odds)
  end
  
  def job_dependencies_satisfied(job, town)
    job.dependencies.each do |dependency|
      unless town.jobs.find{|j| j.name == dependency}
        return false
      end
    end
    true
  end
  
  def rand_allowed_job(town)
    loop do
      job = rand_job
      if job_dependencies_satisfied(job, town)
        return job
      end
    end
  end
end