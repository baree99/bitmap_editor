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
        check_bitmap_not_created
        size = line.split(' ')
        @bitmap = Bitmap.new(size)
      when 'L'
        check_bitmap_created
        args = line.split(' ')
        @bitmap.change_pixel_colour(args)
      when 'C'
        check_bitmap_created
        @bitmap.clear_pixels
      when 'V'
        check_bitmap_created
        args = line.split(' ')
        @bitmap.change_pixel_colours_vertically(args)
      when 'H'
        check_bitmap_created
        args = line.split(' ')
        @bitmap.change_pixel_colours_horizontally(args)
      when 'S'
        check_bitmap_created
        Output.new.show(@bitmap.pixels)
      else
        raise 'unrecognised command :('
      end
    end

    def check_bitmap_not_created
      raise 'Bitmap already created' if defined? @bitmap
    end

    def check_bitmap_created
      raise 'A bitmap has to be created first' unless defined? @bitmap
    end
end
