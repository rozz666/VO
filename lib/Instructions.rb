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
      cond = @stack.pop
      n = @stack.pop
      cond != 0 ? n : 0
    end
  end
  
  class Swap
    def initialize stack
      @stack = stack
    end
    def run
      val1 = @stack.pop
      val2 = @stack.pop
      @stack.push val1
      @stack.push val2
      0
    end
  end
  
  class Push
    def initialize stack, value
      @stack, @value = stack, value
    end
    def run
      @stack.push @value
      0
    end
  end
  
  class Pop
    def initialize stack
      @stack = stack
    end
    def run
      @stack.pop
      0
    end
  end

  class Add
    def initialize stack
      @stack = stack
    end
    def run
      @stack.push @stack.pop + @stack.pop
      0
    end
  end

  class Mul
    def initialize stack
      @stack = stack
    end
    def run
      @stack.push @stack.pop * @stack.pop
      0
    end
  end

  class Neg
    def initialize stack
      @stack = stack
    end
    def run
      @stack.push -@stack.pop
      0
    end
  end

  class Inv
    def initialize stack
      @stack = stack
    end
    def run
      @stack.push 1.0 / @stack.pop
      0
    end
  end
  
  class Movf
    def initialize cell
      @cell = cell
    end
    def run
      @cell.moveForward
      0
    end
  end
  
  class Rotl
    def initialize cell
      @cell = cell
    end
    def run
      @cell.turnLeft
      0
    end
  end
  
  class Rotr
    def initialize cell
      @cell = cell
    end
    def run
      @cell.turnRight
      0
    end
  end
end