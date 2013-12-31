module TownGenerator; end

Dir.glob(File.expand_path("../**/*.rb", __FILE__)).sort.each do |file|
  require file
end

# puts TownGenerator::TownGenerator.go.inspect