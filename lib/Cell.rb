class Cell
  def initialize initialEnergy
    @energy = initialEnergy
  end
  def dead?
    @energy.zero?
  end
end
