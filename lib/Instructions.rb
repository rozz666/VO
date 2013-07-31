module Instructions
  class Eat
    def initialize environment, stack, cell
      @environment, @stack, @cell = environment, stack, cell 
    end
    def run
      food = @environment.getFoodFrom(@cell.position)
      if food.nil? then
        @stack.push 0
        return 0
      end
      @cell.addEnergy food
      @stack.push 1
      0
    end
  end
  
  class Store
    def initialize stack, memory
      @stack, @memory = stack, memory
    end
    def run
      addr = @stack.pop
      @memory.storeValueAt(@stack.pop, addr)
      0
    end
  end

  class Load
    def initialize stack, memory
      @stack, @memory = stack, memory
    end
    def run
      addr = @stack.pop
      @stack.push @memory.loadFrom(addr)
      0
    end
  end
  
  class Copy
    def initialize cell, environment
      @cell, @environment = cell, environment
    end
    def run
      @environment.addCellNear @cell.createCopy, @cell.position
      0 
    end
  end
  
  class Skip
    def initialize stack
      @stack = stack
    end
    def run
      @stack.pop
    end
  end

  class SkipIf
    def initialize stack
      @stack = stack
    end
    def run
      @stack.pop
      @stack.pop
    end
  end
end