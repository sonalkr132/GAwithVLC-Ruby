require_relative 'GAwithVLC/population.rb'
require_relative 'GAwithVLC/points.rb'

NUMBER_OF_POINTS = 60
POINTS_RANGE = 100

population = GAwithVLC::Population.new(points_size: NUMBER_OF_POINTS)

points = GAwithVLC::Points.new(NUMBER_OF_POINTS, POINTS_RANGE)
points.gen_random_points
points.calc_distances

