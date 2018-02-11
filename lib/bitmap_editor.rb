require_relative './bitmap.rb'
require_relative './output.rb'

class BitmapEditor

  attr_reader :bitmap

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      command_interpreter(line)
    end
  end

private

    def command_interpreter(line)
      case line.slice!(0)
      when 'I'
        size = line.split(' ')
        @bitmap = Bitmap.new(size)
      when 'L'
        args = line.split(' ')
        @bitmap.change_pixel_colour(args)
      when 'C'
        @bitmap.clear_pixels
      when 'V'
        args = line.split(' ')
        @bitmap.change_pixel_colours_vertically(args)
      when 'H'
        args = line.split(' ')
        @bitmap.change_pixel_colours_horizontally(args)
      when 'S'
          Output.new.show(@bitmap.pixels)
      else
          puts 'unrecognised command :('
      end
    end
end
