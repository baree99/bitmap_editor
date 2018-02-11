require 'bitmap_editor'

describe BitmapEditor do
  describe '#run' do
    it 'edits a bitmap regarding a file input' do
      output = "OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n"
      expect { subject.run('./examples/test.txt') }.to output(output).to_stdout
    end
  end
end
