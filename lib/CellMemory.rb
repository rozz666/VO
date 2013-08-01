class CellMemory
  def initialize size
    @values = Array.new(size, 0)
  end
  def storeValueAt val, addr
    @values[addr] = val if addr < @values.size && addr >= 0
  end
  def loadFrom addr
    return 0 if addr < 0 || addr >= @values.size 
    @values[addr]
  end
end