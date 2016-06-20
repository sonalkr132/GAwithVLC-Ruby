require 'yaml'

module GAwithVLC
  class Points
    attr_reader :ary, :dist

    def initialize(number_of_points)
      @number_of_points = number_of_points
    end

    def gen_random_points(points_range)
      @ary = []
      @number_of_points.times do
        @ary << [rand(points_range), rand(points_range)]
      end

      puts "points are: #{ary}"
    end

    def calc_distances
      @dist = []
      (0..@number_of_points - 1).each do |i|
        @dist[i] = []
        (0..@number_of_points - 1).each do |j|
          @dist[i][j] = distance_between(ary[i], ary[j])
        end
      end
    end

    def load_from_yaml(file)
      yml_data = YAML.load_file(File.expand_path(File.join(__dir__, '../data/array.yml')))
      @ary = yml_data[file.to_s]
    end

    private

    def distance_between(point_i, point_j)
      dx = point_i[0] - point_j[0]
      dy = point_i[1] - point_j[1]
      Math.sqrt(dx * dx + dy * dy)
    end
  end
end
