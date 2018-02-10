require 'bitmap'

describe Bitmap do
  before(:each) do
    @bitmap = Bitmap.new(3, 2)
  end

  describe '#initialize' do
    it 'creates a white bitmap with the given size when initialized' do
      bitmap = [['O', 'O', 'O'],
                ['O', 'O', 'O']]
      expect(@bitmap.bitmap).to eq bitmap
    end
  end
end
