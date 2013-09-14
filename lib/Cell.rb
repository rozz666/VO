class Cell
  attr_reader :energy
  attr_accessor :position
  def initialize initialEnergy
    @energy = initialEnergy
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
end
