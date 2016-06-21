module GAwithVLC
  class Chromosome
    attr_reader :size, :genes

    def initialize(size)
      @size = size
      genes_ary = (0..size - 1).to_a
      @genes = genes_ary.shuffle
    end

    # evaluats the total sum of distances between the genes/points of the chromosome
    # @params dist 2D array of distance between all the points
    def evaluate(dist)
      sum = dist[genes[0]][genes[size - 1]]
      (1..size - 1).each do |idx|
        sum += dist[genes[idx]][genes[idx - 1]]
      end
      sum
    end
  end
end
