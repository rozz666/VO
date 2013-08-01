require 'CellStack'

describe :CellStack do
  context "#pop" do
    it "should return nil for an empty stack" do
      stack = CellStack.new.pop
    end
  end
end