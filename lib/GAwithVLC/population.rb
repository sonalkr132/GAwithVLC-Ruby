require_relative 'points.rb'
require_relative 'chromosome.rb'

module GAwithVLC
  class Population
    attr_accessor :points, :scores, :chromosomes, :roulette
    attr_reader :alltime_best_chromosome, :best_score, :current_best_chromosome

    def initialize(population_size: 30,
                   crossover_prob: 0.9,
                   mutation_prob: 0.01,
                   points_size: 50,
                   elitism: 4)
      @population_size = population_size
      @crossover_prob = crossover_prob
      @mutation_prob = mutation_prob
      @points_size = points_size
      @elitism = elitism

      @scores = Array.new(population_size)
      @chromosomes = []
    end

    # Generates @points_size number of random points in given range
    # @params points_range maximum number upto which random numbers will be gen
    def random_points(points_range)
      @points = GAwithVLC::Points.new(@points_size)
      points.gen_random_points(points_range)
      points.calc_distances
    end

    # Loads fixed points from the file data/array.yml
    # @params elements_type can be on the tags used in yml file
    def load_points(elements_type)
      @points = GAwithVLC::Points.new(@points_size)
      points.load_from_yaml(elements_type)
      points.calc_distances
    end

    # Intializes chromosomes with random chromosomes
    # also set the best scores array, best_score and best chromosome for current gen
    def initialize_population
      @population_size.times do
        chromosome = GAwithVLC::Chromosome.new(@points_size)
        chromosomes << chromosome
      end

      set_best_score
    end

    def next_generation
      selection
    end

    def selection
      parents = []
      parents << current_best_chromosome
      parents << alltime_best_chromosome.dup.inversion_mutation
      parents << alltime_best_chromosome.dup.swap_mutation
      parents << alltime_best_chromosome.dup

      set_roulette

      prang = Random.new
      (@elitism..@population_size - 1).each do
        parents << chromosomes[spin_wheel prang.rand(1.0)]
      end

      @chromosomes = parents
    end

    private

    def set_best_score
      i = 0
      @chromosomes.each do |chromosome|
        @scores[i] = chromosome.evaluate(@points.dist)
        i += 1
      end

      current_best, current_best_idx = scores.each_with_index.min
      @current_best_chromosome = chromosomes[current_best_idx].dup

      if alltime_best_chromosome.nil? || best_score > current_best
        @alltime_best_chromosome = chromosomes[current_best_idx].dup
        @best_score = current_best
      end
    end

    def set_roulette
      fitness = scores.map { |score| 1.0 / score }

      sum = fitness.inject(:+)
      @roulette = fitness.map { |f| f / sum }
      (1..roulette.size - 1).each { |i| roulette[i] += roulette[i - 1] }
    end

    def spin_wheel(random_number)
      roulette.each_index.detect { |i| random_number < roulette[i] }
    end
  end
end
