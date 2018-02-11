class Bitmap

  attr_reader :pixels

  def initialize(x, y)
    @pixels = create_pixels(x, y)
  end

  def change_pixel_colour(x, y, colour)
    @pixels[y-1][x-1] = colour
  end

  def clear_pixels
    @pixels.map! do |y|
      y.map! do |x|
        x = 'O'
      end
    end
  end

  def change_pixel_colours_vertically(x, y_start, y_end, colour)
    y = y_start
    until y > y_end do
      change_pixel_colour(x, y, colour)
      y += 1
    end
  end

private
    def create_pixels(x, y)
      pixels = []
      y.times { pixels << Array.new(x, 'O') }
      pixels
    end
end
