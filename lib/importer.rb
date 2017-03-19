class Importer
  DIRECTIONS = {
    'N' => :north,
    'E' => :east,
    'S' => :south,
    'W' => :west
  }.freeze

  COMMANDS = {
    'M' => :move,
    'R' => :rotate_right,
    'L' => :rotate_left
  }.freeze

  attr_reader :x_max, :y_max, :start_vector, :commands

  def initialize(file)
    contents = File.read(file)

    @x_max, @y_max = contents.lines[0].split.map(&:to_i)
    @start_vector = start_vector_to_hash contents.lines[1].split
    @commands = contents.lines[2].strip.split('')
                        .map { |cmd| command_to_sym(cmd) }
  end

  private

  def start_vector_to_hash(line2)
    {
      x: line2[0].to_i,
      y: line2[1].to_i,
      direction: direction_to_sym(line2[2])
    }
  end

  def direction_to_sym(direction)
    DIRECTIONS[direction]
  end

  def command_to_sym(command)
    COMMANDS[command]
  end
end
