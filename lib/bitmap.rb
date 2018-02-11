class Bitmap

  MIN_SIZE = 0
  MAX_SIZE = 250
  WHITE = 'O'

  attr_reader :pixels

  def initialize(size)
    x, y = size
    @pixels = create_pixels(x.to_i, y.to_i)
  end

  def change_pixel_colour(args)
    x, y, colour = args
    check_pixel_exist(x, y)
    @pixels[y.to_i-1][x.to_i-1] = colour
  end

  def clear_pixels
    @pixels.map! do |y|
      y.map! do |x|
        x = WHITE
      end
    end
  end

  def change_pixel_colours_vertically(args)
    x, y_start, y_end, colour = args
    check_first_pixel_lower_than_last(y_start, y_end)
    y = y_start.to_i
    until y > y_end.to_i do
      change_pixel_colour([x, y, colour])
      y += 1
    end
  end

  def change_pixel_colours_horizontally(args)
    x_start, x_end, y, colour = args
    check_first_pixel_lower_than_last(x_start, x_end)
    x = x_start.to_i
    until x > x_end.to_i do
      change_pixel_colour([x, y, colour])
      x += 1
    end
  end

private
    def create_pixels(x, y)
      check_min_and_max_size(x, y)
      pixels = []
      y.times { pixels << Array.new(x, WHITE) }
      pixels
    end

    def check_pixel_exist(x, y)
      raise "Pixel doesn't exist" if x.to_i > @pixels[0].count || y.to_i > @pixels.count || x.to_i < 1 || y.to_i < 1
    end

    def check_min_and_max_size(x, y)
      raise "Bitmap size can't be lower than #{MIN_SIZE}" if x < MIN_SIZE || y < MIN_SIZE
      raise "Bitmap size can't be higher than #{MAX_SIZE}" if x > MAX_SIZE || y > MAX_SIZE
    end

    def check_first_pixel_lower_than_last(first, last)
      raise 'First pixel to colour has to be lower than the last pixel' if first.to_i > last.to_i
    end
end
