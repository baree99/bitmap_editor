require 'bitmap'

describe Bitmap do
  describe '#create' do
    it 'creates a white bitmap with the given size' do
      height = 2
      width = 3
      bitmap = [['O', 'O', 'O'],
                ['O', 'O', 'O']]
      expect(subject.create(height, width)).to eq bitmap
    end
  end
end
