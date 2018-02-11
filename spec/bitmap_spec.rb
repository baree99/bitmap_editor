require 'bitmap'

describe Bitmap do
  before(:each) do
    @bitmap = Bitmap.new(3, 2)
  end

  describe '#initialize' do
    it 'creates a white bitmap with the given size when initialized' do
      expected_bitmap = [['O', 'O', 'O'],
                ['O', 'O', 'O']]
      expect(@bitmap.bitmap).to eq expected_bitmap
    end
  end

  describe '#change_colour' do
    it 'changes the colour in a give position' do
      @bitmap.change_colour(3, 2, 'C')
      expected_bitmap = [['O', 'O', 'O'],
                         ['O', 'O', 'C']]
      expect(@bitmap.bitmap).to eq expected_bitmap
    end
  end
end
