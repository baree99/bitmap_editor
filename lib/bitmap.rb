class Bitmap
  def create(height, width)
    bitmap = []
    height.times { bitmap << Array.new(width, 'O') }
    bitmap
  end
end
