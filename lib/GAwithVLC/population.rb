module GAwithVLC
  class Population
    def initialize(population_size: 30, crossover_prob: 0.9, mutation_prob: 0.01, points_size: 50)
      @population_size = population_size
      @crossover_prob = crossover_prob
      @mutation_prob = mutation_prob
      @points_size = points_size
    end

    def initialize_population
      @chromosomes = []
      @population_size.times do
        @chromosomes << Chromosome.gen_random(@points_size)
      end
    end
  end
end
