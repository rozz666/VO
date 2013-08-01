class CellStack
  def initialize size
    @size = size
    @elements = []
  end
  def pop
    @elements.pop
  end
  def push val
    @elements.shift if @elements.count == @size
    @elements.push val
  end
end