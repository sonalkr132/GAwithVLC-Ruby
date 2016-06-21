require_relative 'GAwithVLC/population.rb'

NUMBER_OF_POINTS = 20
POINTS_RANGE = 100

population = GAwithVLC::Population.new(points_size: 4)
population.set_random_points(100)
population.initialize_population
