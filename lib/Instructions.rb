module Instructions
  class Eat
    def initialize environment, stack, cell
      @environment, @stack, @cell = environment, stack, cell 
    end
    def run
      @cell.addEnergy @environment.getFoodFrom(@cell.position)
      @stack.push 1
    end
  end
end