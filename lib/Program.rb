class Program
  def initialize instructions
    @instructions = instructions
  end
  def step
    @instructions[0].run
  end
end