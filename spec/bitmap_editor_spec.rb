require 'bitmap_editor'

describe BitmapEditor do
  describe '#command_interpreter' do
    it 'creates a new bitmap' do
      line = 'I 5 6'
      subject.command_interpreter(line)
      pixels = [['O', 'O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O', 'O']]
      expect(subject.bitmap.pixels).to eq pixels
    end
  end
end
