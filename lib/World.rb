class World
  def initialize cells
    @cells = cells
  end
  def run numIterations
  end
  def step
    @cells.delete_if &:dead?
    @cells.each &:step
  end
end
