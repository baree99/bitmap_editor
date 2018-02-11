require 'bitmap'

describe Bitmap do
  before(:each) do
    size = [4,4]
    @bitmap = Bitmap.new(size)
  end

  describe '#initialize' do
    it 'creates a white bitmap with the given size when initialized' do
      pixels = [['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O']]
      expect(@bitmap.pixels).to eq pixels
    end
  end

  describe '#change_pixel_colour' do
    it 'changes the colour in a given pixel' do
      @bitmap.change_pixel_colour(3, 2, 'C')
      pixels = [['O', 'O', 'O', 'O'],
                ['O', 'O', 'C', 'O'],
                ['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O']]
      expect(@bitmap.pixels).to eq pixels
    end
  end

  describe '#clear_pixels' do
    it 'changes the colour of every pixel to white' do
      @bitmap.change_pixel_colour(1, 1, 'R')
      @bitmap.change_pixel_colour(2, 2, 'R')
      @bitmap.change_pixel_colour(3, 2, 'Y')
      @bitmap.clear_pixels
      pixels = [['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O']]
      expect(@bitmap.pixels).to eq pixels
    end
  end

  describe '#change_pixel_colours_vertically' do
    it 'changes the colour of pixels vertically' do
      @bitmap.change_pixel_colours_vertically(2, 2, 4, 'C')
      pixels = [['O', 'O', 'O', 'O'],
                ['O', 'C', 'O', 'O'],
                ['O', 'C', 'O', 'O'],
                ['O', 'C', 'O', 'O']]
      expect(@bitmap.pixels).to eq pixels
    end
  end

  describe '#change_pixel_colours_horizontally' do
    it 'changes the colour of pixels horizontally' do
      @bitmap.change_pixel_colours_horizontally(1, 4, 3, 'C')
      pixels = [['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O'],
                ['C', 'C', 'C', 'C'],
                ['O', 'O', 'O', 'O']]
      expect(@bitmap.pixels).to eq pixels
    end
  end
end
