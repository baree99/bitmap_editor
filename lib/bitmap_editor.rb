require_relative './bitmap.rb'
require_relative './output.rb'

class BitmapEditor

  attr_reader :bitmap

  def run(file)
    raise 'Please provide correct file' if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
      command_interpreter(line)
    end
  end

private

    def command_interpreter(line)
      case line.slice!(0)
      when 'I'
        raise 'Bitmap already created' if defined? @bitmap
        size = line.split(' ')
        @bitmap = Bitmap.new(size)
      when 'L'
        raise 'A bitmap has to be created first' unless defined? @bitmap
        args = line.split(' ')
        @bitmap.change_pixel_colour(args)
      when 'C'
        raise 'A bitmap has to be created first' unless defined? @bitmap
        @bitmap.clear_pixels
      when 'V'
        raise 'A bitmap has to be created first' unless defined? @bitmap
        args = line.split(' ')
        @bitmap.change_pixel_colours_vertically(args)
      when 'H'
        raise 'A bitmap has to be created first' unless defined? @bitmap
        args = line.split(' ')
        @bitmap.change_pixel_colours_horizontally(args)
      when 'S'
        raise 'A bitmap has to be created first' unless defined? @bitmap
        Output.new.show(@bitmap.pixels)
      else
        raise 'unrecognised command :('
      end
    end
end
