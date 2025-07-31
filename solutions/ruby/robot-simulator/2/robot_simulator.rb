class Robot
  DIRECTIONS = %i[north south east west].freeze

  attr_accessor :bearing, :coordinates

  def initialize
    @bearing = nil
    @coordinates = []
  end

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include? direction

    @bearing = direction
  end

  def turn_right
    @bearing = case bearing
                   when :north
                     :east
                   when :east
                     :south
                   when :south
                     :west
                   else
                     :north
                   end
  end

  def turn_left
    @bearing = case bearing
                   when :north
                     :west
                   when :west
                     :south
                   when :south
                     :east
                   else
                     :north
                   end
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    case bearing
    when :north
      coordinates[1] += 1
    when :west
      coordinates[0] -= 1
    when :south
      coordinates[1] -= 1
    else
      coordinates[0] += 1
    end
  end
end

class Simulator
  def instructions(instructions)
    commands = []

    instructions_commands = {
      'L' => :turn_left,
      'R' => :turn_right,
      'A' => :advance
    }

    instructions.each_char { |instruction| commands << instructions_commands[instruction] }

    commands
  end

  def place(robot, x: 0, y: 0, direction: nil)
    robot.at(x, y)
    robot.bearing = direction
  end

  def evaluate(robot, instructions)
    instructions(instructions).each { |command| robot.send(command) }
  end
end
