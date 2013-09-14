class Program
  def initialize instructions
    @instructions = instructions
    @index = 0
  end
  def step
    delta = @instructions[@index].run
    @index += 1 + delta
    @index = 0 if @index < 0 || @index >= @instructions.size
  end
end