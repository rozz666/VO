require 'CellMemory'

describe :CellMemory do
  before(:each) {
    @memory = CellMemory.new(10)
  }
  it "should store values at given addresses" do
    @memory.storeValueAt 44, 0
    @memory.storeValueAt 55, 9
    @memory.loadFrom(0).should be(44)
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
  it "should ignore out of range writes" do
    @memory.storeValueAt :BAD, 9
    @memory.storeValueAt 33, -1
    @memory.storeValueAt 99, 10
    @memory.loadFrom(-1).should eq(0)
    @memory.loadFrom(10).should eq(0)
  end
end