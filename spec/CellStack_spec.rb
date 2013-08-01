require 'CellStack'

describe :CellStack do
  before(:each) do
    @stack = CellStack.new(10)
  end
  context "#pop" do
    it "should return nil for an empty stack" do
      @stack.pop.should be_nil
    end
  end
  context "#push" do
    it "should discard oldest elements when overflowing" do
      stack = CellStack.new(2)
      stack.push :OLD
      2.times { stack.push :VAL }
      2.times { stack.pop.should be(:VAL) }
      stack.pop.should be_nil
    end
  end
  it "should pop pushed values in reverse order" do
    @stack.push :FIRST
    @stack.push :SECOND
    @stack.pop.should be(:SECOND)
    @stack.pop.should be(:FIRST)
  end
end