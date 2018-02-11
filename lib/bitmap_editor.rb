class BitmapEditor

  attr_reader :bitmap

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    File.open(file).each do |line|
      line = line.chomp
    end
  end

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
    when 'S'
        puts "There is no image"
    else
        puts 'unrecognised command :('
    end
  end
end
