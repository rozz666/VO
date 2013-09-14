class World
  def initialize cells
    @cells = cells
  end
  def run numIterations
  end
  def step
    @cells.each &:step
  end
end
