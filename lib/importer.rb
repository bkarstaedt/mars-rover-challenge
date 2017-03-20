class Importer
  MIN_COORD_VAL = 1
  VALID_LINE_NUMBER = 3

  REGEX_LINE1 = /\A\s*\d{1}\s+\d{1}\s*\Z/
  REGEX_LINE2 = /\A\s*\d{1}\s+\d{1}\s+[N,E,S,W]\s*\Z/
  REGEX_LINE3 = /\A\s*[MLR]+\s*\Z/

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

  def initialize(file_contents)
    cmd_lines = file_contents.strip.lines

    if cmd_lines.length != VALID_LINE_NUMBER
      raise ArgumentError, 'unusal line number detected'
    end

    @x_max, @y_max = coordinates cmd_lines[0]
    @start_vector = start_vector_to_hash cmd_lines[1]
    @commands = commands_to_arr cmd_lines[2]
  end

  private

  def coordinates(line1)
    unless line1.match REGEX_LINE1
      raise ArgumentError, "unusal line 1 syntax ('#{line1}') detected"
    end
    x, y = line1.split.map(&:to_i)
    if x < MIN_COORD_VAL || y < MIN_COORD_VAL
      raise ArgumentError, 'unusal coordinate in line 1 detected'
    end
    [x, y]
  end

  def start_vector_to_hash(line2)
    unless line2.match REGEX_LINE2
      raise ArgumentError, "unusal line 2 syntax ('#{line2}') detected"
    end
    line_data = line2.split
    {
      x: line_data[0].to_i,
      y: line_data[1].to_i,
      direction: direction_to_sym(line_data[2])
    }
  end

  def commands_to_arr(line3)
    unless line3.match REGEX_LINE3
      raise ArgumentError, "unusal line 3 syntax ('#{line3}') detected"
    end
    line3.strip.split('').map { |cmd| command_to_sym(cmd) }
  end

  def direction_to_sym(direction)
    DIRECTIONS[direction]
  end

  def command_to_sym(command)
    COMMANDS[command]
  end
end
