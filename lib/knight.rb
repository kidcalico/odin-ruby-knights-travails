require_relative 'square_node'

class Knight
  attr_accessor :moves, :root, :visited

  def initialize(position)
    @position = position
    @visited = []
    @root = build_graph(@position)
  end

  def knight_moves(position, target)
    # calculate the shortest path from position to target
  end

  # def target_path(target, root = @root, index = 0, indices = [])
  #   return if root.nil?
  #   return index if target == root.position

  #   # return 1 if any of the root's children have the target position

  #   root.moves.each { |move| indices << target_path(target, move, index + 1, indices) }

  #   indices.reject! { |index| index.nil? }
  #   return indices if index.zero?

  #   index
  # end

  def include_target?(target, root = @root)
    return nil if root.nil?
    return true if root.position == target
    return true if root.moves.any? { |move| include_target?(target, move) }

    false
  end

  def build_graph(position)
    return nil if !@visited.nil? && @visited.include?(position)

    @visited.push(position)

    root = Square.new(position)

    possible = possible_moves(position)

    possible.each { |link| root.moves << build_graph(link) }

    root
  end

  def possible_moves(position)
    all_moves = all_moves(position)
    filter_moves(all_moves)
  end

  def filter_moves(moves)
    moves = moves.reject { |move| move.any? { |v| v < 0 || v > 7 } }
  end

  def all_moves(position)
    [
      [position[0] + 1, position[1] + 2], [position[0] - 1, position[1] + 2],
      [position[0] + 1, position[1] - 2], [position[0] - 1, position[1] - 2],
      [position[0] + 2, position[1] + 1], [position[0] + 2, position[1] - 1],
      [position[0] - 2, position[1] + 1], [position[0] - 2, position[1] - 1]
    ]
  end
end
