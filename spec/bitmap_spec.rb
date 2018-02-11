require 'bitmap'

describe Bitmap do
  before(:each) do
    @bitmap = Bitmap.new(3, 2)
  end

  describe '#initialize' do
    it 'creates a white bitmap with the given size when initialized' do
      pixels = [['O', 'O', 'O'],
                ['O', 'O', 'O']]
      expect(@bitmap.pixels).to eq pixels
    end
  end

  describe '#change_colour' do
    it 'changes the colour in a give position' do
      @bitmap.change_pixel_colour(3, 2, 'C')
      pixels = [['O', 'O', 'O'],
                         ['O', 'O', 'C']]
      expect(@bitmap.pixels).to eq pixels
    end
  end

  describe '#clear_pixels' do
    it 'changes the colour of every pixel to white' do
      @bitmap.change_pixel_colour(1, 1, 'R')
      @bitmap.change_pixel_colour(2, 2, 'R')
      @bitmap.change_pixel_colour(3, 2, 'Y')
      @bitmap.clear_pixels
      pixels = [['O', 'O', 'O'],
                ['O', 'O', 'O']]
      expect(@bitmap.pixels).to eq pixels
    end
  end
end
