require 'CellStack'

describe :CellStack do
  context "#pop" do
    it "should return nil for an empty stack" do
      stack = CellStack.new.pop
    end
  end
  it "should pop pushed values in reverse order" do
    stack = CellStack.new
    stack.push :FIRST
    stack.push :SECOND
    stack.pop.should be(:SECOND)
    stack.pop.should be(:FIRST)
  end
end