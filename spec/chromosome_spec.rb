require 'spec_helper'
require 'GAwithVLC/chromosome'

describe 'Chromosome' do
  describe '#evaluate' do
    before do
      @chromosome = GAwithVLC::Chromosome.new(4)
    end

    it 'evaluate score of chromosome' do
      allow(@chromosome).to receive(:genes) { [2, 0, 1, 3] }
      dist = [[0, 2, 4, 3],
              [2, 0, 4, 1],
              [4, 4, 0, 3],
              [3, 1, 3, 0]]
      expect(@chromosome.evaluate(dist)).to eq 10
    end
  end
end
