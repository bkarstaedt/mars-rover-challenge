require 'tty-cursor'

class ZonePrinter
  WIDTH = 5

  ARROW_NORTH = '▲'.freeze
  ARROW_EAST  = '▶'.freeze
  ARROW_SOUTH = '▼'.freeze
  ARROW_WEST  = '◀'.freeze

  def initialize(x_max, y_max)
    @x_max = x_max
    @y_max = y_max
    @printed_once = false
    @cursor = TTY::Cursor
  end

  def update(x_new, y_new, direction)
    zone_str = zone_str()

    print @cursor.up(zone_str.lines.length) if @printed_once
    print zone_str + "\n"
    print_rover x_new, y_new, direction

    @printed_once = true
  end

  private

  def zone_str
    rows = []

    first_row   = '┌' + (['─' * WIDTH] * @x_max).join('┬') + '┐'
    row         = '│' + ([' ' * WIDTH] * @x_max).join('│') + '│'
    row_divider = '├' + (['─' * WIDTH] * @x_max).join('┼') + '┤'
    last_row    = '└' + (['─' * WIDTH] * @x_max).join('┴') + '┘'

    rows << first_row
    rows << ([row] * @y_max).join("\n" + row_divider + "\n")
    rows << last_row

    rows.join "\n"
  end

  def print_rover(x_new, y_new, direction)
    x = (WIDTH - 2) + ((WIDTH + 1) * (x_new - 1))
    y = y_new * (WIDTH - 3)

    print @cursor.save
    print @cursor.move x, y
    print arrow direction
    print @cursor.restore
  end

  def arrow direction
    {
      north: ARROW_NORTH,
      east: ARROW_EAST,
      south: ARROW_SOUTH,
      west: ARROW_WEST,
    }[direction]
  end

end
