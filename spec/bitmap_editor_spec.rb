require 'bitmap_editor'

describe BitmapEditor do
  before(:each) do
    line = 'I 5 6'
    @bitmap_editor = BitmapEditor.new
    @bitmap_editor.command_interpreter(line)
  end

  describe '#command_interpreter' do
    it 'delegates to create a new bitmap' do
      pixels = [['O', 'O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O', 'O'],
                ['O', 'O', 'O', 'O', 'O']]
      expect(@bitmap_editor.bitmap.pixels).to eq pixels
    end

    it 'delegates to change pixel colour' do
      line = 'L 1 3 A'
      expect(@bitmap_editor.bitmap).to receive(:change_pixel_colour).with(['1', '3', 'A'])
      @bitmap_editor.command_interpreter(line)
    end
  end
end
