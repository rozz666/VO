require 'CellMemory'

describe :CellMemory do
  it "should store values at given addresses" do
    memory = CellMemory.new
    memory.storeValueAt 44, 3
    memory.storeValueAt 55, 4
    memory.loadFrom(3).should be(44)
    memory.loadFrom(4).should be(55)
  end
end