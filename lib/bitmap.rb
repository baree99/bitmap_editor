class Bitmap

  attr_reader :bitmap

  def initialize(x, y)
    @bitmap = create_bitmap(x, y)
  end

private
    def create_bitmap(x, y)
      bitmap = []
      y.times { bitmap << Array.new(x, 'O') }
      bitmap
    end
end
