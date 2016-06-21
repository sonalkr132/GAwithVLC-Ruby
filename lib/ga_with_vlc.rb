require_relative 'GAwithVLC/population.rb'

NUMBER_OF_POINTS = 20
POINTS_RANGE = 100

population = GAwithVLC::Population.new(population_size: 10, points_size: 20)
population.load_points('20_elements')
population.initialize_population
puts population.chromosomes.inspect
population.next_generation
puts
puts population.chromosomes.inspect
