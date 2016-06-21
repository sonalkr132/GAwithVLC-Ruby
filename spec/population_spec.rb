require 'spec_helper'
require 'GAwithVLC/population'

describe 'Population' do
  before do
    @population = GAwithVLC::Population.new(population_size: 2, points_size: 4)
  end

  describe '#load_points' do
    before { @population.load_points('4_elements') }

    it 'loads 3 elements in points array' do
      expect(@population.points.ary.size).to eq 4
    end

    it 'set distance array of points' do
      expect(@population.points.dist.size).to eq 4
    end
  end

  describe '#initialize_population' do
    before do
      @population.load_points('4_elements')
      @population.initialize_population
    end

    it 'sets chromosomes' do
      expect(@population.chromosomes.size).to eq 2
    end

    it 'sets best score of first generation' do
      expect(@population.best_score).to eq @population.scores.min
    end
  end
end
