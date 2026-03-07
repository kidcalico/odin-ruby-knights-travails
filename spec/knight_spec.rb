require_relative '../lib/knight'

describe Knight do
  subject(:knight) { described_class.new([0, 0]) }
  describe '#filter_moves' do
    context 'given an array of all computed moves from a given position' do
      it 'rejects all sub-arrays containing values less than 0' do
        array = [[1, 2], [-1, 2], [2, 1], [2, -1], [-2, 1], [-2, -1], [1, -2], [-1, -2]]
        expected = [[1, 2], [2, 1]]
        result = knight.filter_moves(array)
        expect(result).to eq(expected)
      end

      it 'rejects all sub-arrays containing values more than 7' do
        array = [[8, 9], [6, 9], [9, 8], [9, 6], [5, 8], [5, 6], [8, 5], [6, 5]]
        expected = [[5, 6], [6, 5]]
        result = knight.filter_moves(array)
        expect(result).to eq(expected)
      end

      it 'returns an array containing sub-arrays all with values 0..7 (inclusive)' do
        array = [[5, 6], [3, 6], [6, 5], [6, 3], [2, 5], [2, 3], [5, 2], [3, 2]]
        expected = [[5, 6], [3, 6], [6, 5], [6, 3], [2, 5], [2, 3], [5, 2], [3, 2]]
        result = knight.filter_moves(array)
        expect(result).to eq(expected)
      end
    end
  end

  describe '#knight_moves'
    context 'given a position and a target' do
      xit 'returns an array of steps to get from the position to the target' do
      end
    end
  end
end
