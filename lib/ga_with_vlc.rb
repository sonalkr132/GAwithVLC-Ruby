require_relative 'GAwithVLC/population.rb'

NUMBER_OF_POINTS = 20
POINTS_RANGE = 100

population = GAwithVLC::Population.new(points_size: NUMBER_OF_POINTS)
population.load_points
population.initialize_population
