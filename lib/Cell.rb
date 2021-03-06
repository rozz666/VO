class Cell
  attr_reader :energy
  attr_accessor :position
  attr_writer :program
  def initialize initialEnergy, geneticCode, cloner
    @energy, @geneticCode, @cloner = initialEnergy, geneticCode, cloner
    @direction = Vector[0, 1]
  end
  def dead?
    @energy.zero?
  end
  def step
    @energy -= 1
    @program.step
  end
  def addEnergy e
    @energy += e
  end
  def createCopy
    @cloner.clone @geneticCode
  end
  def moveForward
    @position += @direction
  end
  def rotateLeft
    @direction = Vector[-@direction[1], @direction[0]]
  end
  def rotateRight
    @direction = Vector[@direction[1], -@direction[0]]
  end
end
