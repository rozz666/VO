class CellMemory
  def initialize size
    @values = []
  end
  def storeValueAt val, addr
    @values[addr] = val
  end
  def loadFrom addr
    @values[addr] || 0
  end
end