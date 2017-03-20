class Zone
  MIN_COORD_VAL = 1

  def initialize(x_max, y_max)
    if x_max < MIN_COORD_VAL || y_max < MIN_COORD_VAL
      raise ArgumentError, 'zone width and height must be at least ' + MIN_COORD_VAL
    end

    @x_max = x_max
    @y_max = y_max
  end

  def update(x_new, y_new)
    check_rover_position x_new, y_new
  end

  private

  def check_rover_position(x_new, y_new)
    if x_new > @x_max || x_new < MIN_COORD_VAL
      raise ArgumentError, "rover out of zone in x direction (#{x_new})"
    end
    if y_new > @y_max || y_new < MIN_COORD_VAL
      raise ArgumentError, "rover out of zone in y direction (#{y_new})"
    end
    true
  end
end
