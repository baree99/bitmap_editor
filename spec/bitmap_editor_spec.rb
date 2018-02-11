require 'bitmap_editor'

describe BitmapEditor do
  describe '#run' do
    it 'edits a bitmap regarding a file input' do
      output = "OOOOO\nOOZZZ\nAWOOO\nOWOOO\nOWOOO\nOWOOO\n"
      expect { subject.run('./examples/test.txt') }.to output(output).to_stdout
    end

    it 'raises error when not a correct file was provided' do
      expect { subject.run('test') }.to raise_error('Please provide correct file')
    end
  end
end
