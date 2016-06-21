require_relative 'points.rb'
require_relative 'chromosome.rb'

module GAwithVLC
  class Population
    attr_accessor :points, :scores, :chromosomes
    attr_reader :best_chromosome, :best_score

    def initialize(population_size: 30, crossover_prob: 0.9, mutation_prob: 0.01, points_size: 50)
      @population_size = population_size
      @crossover_prob = crossover_prob
      @mutation_prob = mutation_prob
      @points_size = points_size

      @scores = Array.new(population_size)
      @chromosomes = []
    end

    def set_random_points(points_range)
      @points = GAwithVLC::Points.new(@points_size)
      points.gen_random_points(points_range)
      points.calc_distances
    end

    def load_points(elements_type)
      @points = GAwithVLC::Points.new(@points_size)
      points.load_from_yaml(elements_type)
      points.calc_distances
    end

    def initialize_population
      @population_size.times do
        chromosome = GAwithVLC::Chromosome.new(@points_size)
        chromosomes << chromosome
      end

      set_best_score
    end

    private

    def set_best_score
      i = 0
      @chromosomes.each do |chromosome|
        scores[i] = chromosome.evaluate(@points.dist)
        i += 1
      end

      current_best, current_best_idx = scores.each_with_index.min

      if best_chromosome.nil? || best_score > current_best
        @best_chromosome = chromosomes[current_best_idx].dup
        @best_score = current_best
      end
    end
  end
end
