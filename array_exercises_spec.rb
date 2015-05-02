require 'rspec'
require_relative 'array_exercises'

describe Array do
  describe '#my_uniq' do
    it "removes duplicates from a passed in array" do
      expect([1,2,3,4,4].my_uniq).to eq([1,2,3,4])
    end
  end

  describe '#two_sum' do
    it "returns all pairs of positions where the elements at those positions equal zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])

      expect([1, 2, -1, -2].two_sum).to eq([[0, 2], [1, 3]])
    end
  end
end

describe 'my_transpose method' do
  context 'When provided with a matrix' do
    it 'will convert between row and column oriented representations' do
      expect(my_transpose([
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]])).to eq([[0, 3, 6],
                            [1, 4, 7],
                            [2, 5, 8]])
    end
  end
end

describe 'stock_picker method' do
  context 'When provided with an array of stock prices by sequential days will
           output the most profitable pair of days on which to first buy the
           stock and then sell the stock' do
    it 'will correctly handle input of two days.' do
      expect(stock_picker([6, 7])).to eq([0, 1])
    end
    it 'will correctly handle many days' do
      expect(stock_picker([4, 3, 1, 5, 6, 90, 0])).to eq([2, 5])
    end
  end
end
