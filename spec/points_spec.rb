require 'spec_helper'
require 'GAwithVLC/points'

describe 'Points' do

  describe '#calc_distances' do
    before do
      @points = GAwithVLC::Points.new(3)
      @points.load_from_yaml('3_elements')
    end

    it 'calcuates distance between points of the ary' do
      @points.calc_distances
      dist =  [[0.0, 2.8284271247461903, 4.47213595499958],
               [2.8284271247461903, 0.0, 4.47213595499958],
               [4.47213595499958, 4.47213595499958, 0.0]]
      expect(@points.dist).to eq(dist)
    end
  end
end
