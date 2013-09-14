class Program
  def initialize instructions
    @instructions = instructions
    @index = 0
  end
  def step
    @instructions[@index].run
    @index += 1
  end
end