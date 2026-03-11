require_relative 'square_node'

class Knight
  attr_accessor :moves, :root, :visited, :board, :indices

  def initialize(position = [0, 0], target = [7, 7])
    knight_moves(position, target)
  end

  def knight_moves(position, target)
    print "Initial location: #{position}\nTarget location: #{target}\n"
    search = bfs(position, target)
    puts "Congratulations! You made it in #{search[1]} moves! Here's your path:"
    steps = define_steps(position, target)
    steps.each { |step| print "#{step}\n" }
  end

  def define_steps(position, target)
    steps = []
    last_step = bfs(position, target)

    steps.unshift(last_step[0])
    until last_step[1] == 1
      last_step = bfs(position, last_step[2])
      steps.unshift(last_step[0])
    end
    steps.unshift(position)
  end

  def bfs(position, target)
    queue = []
    explored = Set.new

    explored << position
    queue << [position, 0, nil]

    until queue.empty?
      current_node = queue.shift
      return current_node if current_node[0] == target

      possible_moves(current_node[0]).each do |move|
        unless explored.include?(move)
          explored << move
          queue << [move, current_node[1] + 1, current_node[0]]
        end
      end
    end
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
