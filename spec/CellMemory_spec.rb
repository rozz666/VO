require 'CellMemory'

describe :CellMemory do
  before(:each) {
    @memory = CellMemory.new(10)
  }
  it "should store values at given addresses" do
    @memory.storeValueAt 44, 3
    @memory.storeValueAt 55, 9
    @memory.loadFrom(3).should be(44)
    @memory.loadFrom(9).should be(55)
  end
  it "should initialize elements with 0" do
    @memory.loadFrom(0).should eq(0)
    @memory.loadFrom(3).should eq(0)
  end
  it "should return 0 when reading elements out of range" do
    @memory.loadFrom(-1).should eq(0)
    @memory.loadFrom(10).should eq(0)
    @memory.loadFrom(11).should eq(0)
  end
end