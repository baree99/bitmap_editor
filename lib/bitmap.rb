class Bitmap

  attr_reader :pixels

  def initialize(size)
    x, y = size
    @pixels = create_pixels(x.to_i, y.to_i)
  end

  def change_pixel_colour(args)
    x, y, colour = args
    @pixels[y.to_i-1][x.to_i-1] = colour
  end

  def clear_pixels
    @pixels.map! do |y|
      y.map! do |x|
        x = 'O'
      end
    end
  end

  def change_pixel_colours_vertically(args)
    x, y_start, y_end, colour = args
    y = y_start.to_i
    until y > y_end.to_i do
      change_pixel_colour([x, y, colour])
      y += 1
    end
  end

  def change_pixel_colours_horizontally(args)
    x_start, x_end, y, colour = args
    x = x_start.to_i
    until x > x_end.to_i do
      change_pixel_colour([x, y, colour])
      x += 1
    end
  end

private
    def create_pixels(x, y)
      pixels = []
      y.times { pixels << Array.new(x, 'O') }
      pixels
    end
end
