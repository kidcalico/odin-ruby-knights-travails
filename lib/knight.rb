class Knight
  def initialize(position = [0, 0], target = [7, 7])
    @parents = {}
    @steps = []
    knight_moves(position, target)
  end

  def knight_moves(position, target)
    define_steps(position, target)
    print "Initial location: #{position}\nTarget location: #{target}\n"
    puts "Congratulations, you made it in #{@steps.length - 1} moves! Here's your path:"
    @steps.each { |step| print "#{step}\n" }
  end

  def define_steps(position, target)
    determine_path(position, target)
    @steps << target
    last_step = @parents[target]

    until @steps.include?(position)
      @steps.unshift(last_step)
      last_step = @parents[last_step]
    end
  end

  def determine_path(position, target)
    queue = [position]

    until queue.empty?
      current_node = queue.shift
      return @parents if current_node == target

      possible_moves(current_node).each do |move|
        next if @parents.include?(move)

        @parents[move] = current_node
        queue << move
      end
    end
  end

  def possible_moves(position)
    all_moves = all_moves(position)
    moves = all_moves.reject { |move| move.any? { |v| v < 0 || v > 7 } }
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
