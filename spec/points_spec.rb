require 'spec_helper'
require 'GAwithVLC/points'

describe 'Points' do
  describe '#calc_distances' do
    before do
      @points = GAwithVLC::Points.new(4)
      @points.load_from_yaml('4_elements')
    end

    it 'calcuates distance between points of the ary' do
      @points.calc_distances
      dist = [[0.0, 2.8284271247461903, 4.47213595499958, 3.1622776601683795],
              [2.8284271247461903, 0.0, 4.47213595499958, 1.4142135623730951],
              [4.47213595499958, 4.47213595499958, 0.0, 3.1622776601683795],
              [3.1622776601683795, 1.4142135623730951, 3.1622776601683795, 0.0]]
      expect(@points.dist).to eq(dist)
    end
  end
end
