require 'bitmap'

describe Bitmap do
  before(:each) do
    @bitmap = Bitmap.new(['4', '4'])
  end

  describe '#initialize' do
    it 'creates a white bitmap with the given size when initialized' do
      pixels = [['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O']]
      expect(@bitmap.pixels).to eq pixels
    end

    it "raises error when the bitmap to create is higher than #{Bitmap::MAX_SIZE}" do
      expect { Bitmap.new(['4', Bitmap::MAX_SIZE+1]) }.to raise_error("Bitmap size can't be higher than #{Bitmap::MAX_SIZE}")
    end

    it "raises error when the bitmap to create is lower than #{Bitmap::MIN_SIZE}" do
      expect { Bitmap.new([Bitmap::MIN_SIZE-1, '4']) }.to raise_error("Bitmap size can't be lower than #{Bitmap::MIN_SIZE}")
    end
  end

  describe '#change_pixel_colour' do
    it 'changes the colour in a given pixel' do
      @bitmap.change_pixel_colour(['3', '2', 'C'])
      pixels = [['O', 'O', 'O', 'O'],
                ['O', 'O', 'C', 'O'],
                ['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O']]
      expect(@bitmap.pixels).to eq pixels
    end

    it 'raises error when pixel is not in Bitmap' do
      expect { @bitmap.change_pixel_colour(['5', '5', 'C']) }.to raise_error("Pixel doesn't exist")
    end
  end

  describe '#clear_pixels' do
    it 'changes the colour of every pixel to white' do
      @bitmap.change_pixel_colour(['1', '1', 'R'])
      @bitmap.change_pixel_colour(['2', '2', 'R'])
      @bitmap.change_pixel_colour(['3', '2', 'Y'])
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
      @bitmap.change_pixel_colours_vertically(['2', '2', '4', 'C'])
      pixels = [['O', 'O', 'O', 'O'],
                ['O', 'C', 'O', 'O'],
                ['O', 'C', 'O', 'O'],
                ['O', 'C', 'O', 'O']]
      expect(@bitmap.pixels).to eq pixels
    end

    it 'raises error when first pixel to colour is higher than last pixel' do
      expect { @bitmap.change_pixel_colours_vertically(['2', '4', '3', 'C']) }.to raise_error('First pixel to colour has to be lower than the last pixel')
    end
  end

  describe '#change_pixel_colours_horizontally' do
    it 'changes the colour of pixels horizontally' do
      @bitmap.change_pixel_colours_horizontally(['1', '4', '3', 'C'])
      pixels = [['O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O'],
                ['C', 'C', 'C', 'C'],
                ['O', 'O', 'O', 'O']]
      expect(@bitmap.pixels).to eq pixels
    end

    it 'raises error when first pixel to colour is higher than last pixel' do
      expect { @bitmap.change_pixel_colours_horizontally(['3', '2', '3', 'C']) }.to raise_error('First pixel to colour has to be lower than the last pixel')
    end
  end
end
