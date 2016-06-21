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

    def inversion_mutation
      loop do
        m = rand(size - 2)
        n = rand(size)
        break unless m >= n
      end

      j = ((n - m + 1) >> 1) - 1
      (0..j).each do |i|
        @genes[m + i], @genes[n - i] = @genes[n - i], @genes[m + i]
      end
      self
    end

    def swap_mutation
      loop do
        m = rand(size >> 1)
        n = rand(size)
        break unless m >= n
      end

      c1 = genes[0..m]
      c2 = genes[m..n]
      c3 = genes[n..size - 1]

      @genes = c2 + c1 + c3
      self
    end
  end
end
