class Program
  def initialize instructions
    @instructions = instructions
    @index = 0
  end
  def step
    delta = @instructions[@index].run
    @index += 1 + delta
  end
end