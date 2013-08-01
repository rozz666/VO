require 'CellMemory'

describe :CellMemory do
  before(:each) {
    @memory = CellMemory.new
  }
  it "should store values at given addresses" do
    @memory.storeValueAt 44, 3
    @memory.storeValueAt 55, 4
    @memory.loadFrom(3).should be(44)
    @memory.loadFrom(4).should be(55)
  end
  it "should initialize elements with 0" do
    @memory.loadFrom(0).should eq(0)
    @memory.loadFrom(3).should eq(0)
  end
end