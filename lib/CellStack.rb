class CellStack
  def initialize
    @elements = []
  end
  def pop
    @elements.pop
  end
  def push val
    @elements.push val
  end
end