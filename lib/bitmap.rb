class Bitmap

  attr_reader :pixels

  def initialize(x, y)
    @pixels = create_pixels(x, y)
  end

  def change_pixel_colour(x, y, colour)
    @pixels[y-1][x-1] = colour
  end

private
    def create_pixels(x, y)
      pixels = []
      y.times { pixels << Array.new(x, 'O') }
      pixels
    end
end
