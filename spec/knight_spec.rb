require_relative '../lib/knight'

describe Knight do
  subject(:knight) { described_class.new([0, 0]) }
  describe '#possible_moves' do
    context 'given a position' do
      it 'returns all legal moves from a corner position' do
        position = [0, 0]
        expected = [[1, 2], [2, 1]]
        result = knight.possible_moves(position)
        expect(result).to eq(expected)
      end

      it 'returns all legal moves from a side position' do
        position = [7, 3]
        expected = [[6, 5], [6, 1], [5, 4], [5, 2]]
        result = knight.possible_moves(position)
        expect(result).to eq(expected)
      end

      it 'returns all legal moves from a central position' do
        position = [4, 4]
        expected = [[5, 6], [3, 6], [5, 2], [3, 2], [6, 5], [6, 3], [2, 5], [2, 3]]
        result = knight.filter_moves(position)
        expect(result).to eq(expected)
      end
    end
  end

  describe '#knight_moves' do
    context 'given a position and a target' do
      xit 'returns an array of steps to get from the position to the target' do
      end
    end
  end
end
