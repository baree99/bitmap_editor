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

    it 'delegates to clear pixels' do
      line = 'C'
      expect(@bitmap_editor.bitmap).to receive(:clear_pixels)
      @bitmap_editor.command_interpreter(line)
    end

    it 'delegates to change pixels vertically' do
      line = 'V 2 3 6 W'
      expect(@bitmap_editor.bitmap).to receive(:change_pixel_colours_vertically).with(['2', '3', '6', 'W'])
      @bitmap_editor.command_interpreter(line)
    end

    it 'delegates to change pixels horizontally' do
      line = 'H 3 5 2 Z'
      expect(@bitmap_editor.bitmap).to receive(:change_pixel_colours_horizontally).with(['3', '5', '2', 'Z'])
      @bitmap_editor.command_interpreter(line)
    end
  end
end
