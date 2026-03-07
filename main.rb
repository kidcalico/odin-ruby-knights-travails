require 'rubocop'
require 'pry-byebug'
require_relative 'lib/knight'

test = Knight.new([4, 0])
# p test.possible_moves([7, 6])
# p test.all_squares
# p test.root.position
# p test.moves[0].moves
#
p test.include_target?([0, 0])
p test.include_target?([0, 9])
# p test.visited.length
p test.root.position
p test.target_path([7, 7])
