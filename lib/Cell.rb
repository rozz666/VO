class Cell
  attr_reader :energy
  attr_accessor :position
  def initialize initialEnergy, geneticCode, cloner
    @energy, @geneticCode, @cloner = initialEnergy, geneticCode, cloner
  end
  def dead?
    @energy.zero?
  end
  def step
    @energy -= 1
  end
  def addEnergy e
    @energy += e
  end
  def createCopy
    @cloner.clone @geneticCode
  end
  def moveForward
    @position += Vector[0, 1]
  end
end
