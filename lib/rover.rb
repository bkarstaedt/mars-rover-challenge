class Rover
  DIRECTIONS = {
    north: :east,
    east: :south,
    south: :west,
    west: :north
  }.freeze

  attr_reader :x, :y, :direction

  def initialize(start_vector)
    @x = start_vector[:x]
    @y = start_vector[:y]
    @direction = start_vector[:direction]
  end

  def execute_command(command)
    if command == :move
      @x, @y = next_coordinate(@x, @y, @direction)
    else
      @direction = next_direction(@direction, command)
    end
  end

  def to_s
    "x: #{@x}, y: #{@y}, direction: #{@direction}"
  end

  private

  def next_coordinate(x, y, direction)
    case direction
    when :north
      [x, y + 1]
    when :east
      [x + 1, y]
    when :south
      [x, y - 1]
    when :west
      [x - 1, y]
    end
  end

  def next_direction(current, rotation)
    if rotation == :rotate_right
      DIRECTIONS[current]
    elsif rotation == :rotate_left
      DIRECTIONS.key(current)
    else
      raise "unknown rotation '#{rotation}'"
    end
  end
end
