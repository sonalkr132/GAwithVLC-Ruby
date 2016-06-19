module GAwithVLC
  class Points
    attr_reader :ary, :dist

    def initialize(number_of_points, points_range)
      @number_of_points = number_of_points
      @points_range = points_range
    end

    def gen_random_points
      @ary = []
      @number_of_points.times do
        @ary << [rand(@points_range), rand(@points_range)]
      end

      puts "points are: #{ary}"
    end

    def calc_distances
      @dist = []
      (0..@number_of_points).each do |i|
        @dist[i] = []
        (0..@number_of_points).each do |j|
          @dist[i][j] = distance_between(ary[i], ary[j])
        end
      end
    end

    private

    def distance_between(point_i, point_j)
      dx = point_i[0] - point_j[0]
      dy = point_j[1] - point_j[1]
      sqrt(dx * dx + dy * dy)
    end
  end
end
