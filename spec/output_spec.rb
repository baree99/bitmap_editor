require 'output'

describe Output do
  describe '#show' do
    it 'prints pixels line by line' do
      pixels = [['K', 'O', 'C', 'O'],
                ['O', 'B', 'O', 'L'],
                ['O', 'O', 'Y', 'O'],
                ['N', 'O', 'X', 'O']]
      output = "KOCO\nOBOL\nOOYO\nNOXO\n"
      expect { subject.show(pixels) }.to output(output).to_stdout
    end
  end
end
