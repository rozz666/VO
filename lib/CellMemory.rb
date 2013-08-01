class CellMemory
  def initialize
    @values = []
  end
  def storeValueAt val, addr
    @values[addr] = val
  end
  def loadFrom addr
    @values[addr] || 0
  end
end