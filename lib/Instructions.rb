module Instructions
  class Eat
    def initialize environment, stack, cell
      @environment, @stack, @cell = environment, stack, cell 
    end
    def run
      food = @environment.getFoodFrom(@cell.position)
      if food.nil? then
        @stack.push 0
        return
      end
      @cell.addEnergy food
      @stack.push 1
    end
  end
  
  class Store
    def initialize stack, memory
      @stack, @memory = stack, memory
    end
    def run
      addr = @stack.pop
      @memory.storeValueAt(@stack.pop, addr)
    end
  end
end