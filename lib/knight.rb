class Knight
  def initialize(position = [0, 0], target = [7, 7])
    @parents = {}
    knight_moves(position, target)
  end

  def knight_moves(position, target)
    print "Initial location: #{position}\nTarget location: #{target}\n"
    search = bfs(position, target)
    puts "Congratulations! You made it in #{search[1]} moves! Here's your path:"
    define_steps(position, target).each { |step| print "#{step}\n" }
  end

  def define_steps(position, target)
    steps = [target]
    last_step = @parents[target]

    until steps.include?(position)
      steps.unshift(last_step)
      last_step = @parents[last_step]
    end
    steps
  end

  def bfs(position, target)
    queue = [[position, 0, nil]]

    until queue.empty?
      current_node = queue.shift
      return current_node if current_node[0] == target

      possible_moves(current_node[0]).each do |move|
        next if @parents.include?(move)

        @parents[move] = current_node[0]
        queue << [move, current_node[1] + 1, current_node[0]]
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
