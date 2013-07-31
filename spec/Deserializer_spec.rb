require 'Deserializer'

describe :Deserializer do
  
  before(:each) do
    instructions = [ :i0, [ :i1, :i2, [ :i3, :i4, :i5, :i6 ], :i7 ], :i8, :i9 ]
    @des = Deserializer.new(instructions)
  end
  
  it "should deserialize a sequence into a single instruction" do
    @des.getStream([ 0 ]).getSymbol.should eq(:i0)
    @des.getStream([ 3 ]).getSymbol.should eq(:i9)
    @des.getStream([ 1, 2, 1 ]).getSymbol.should eq(:i4)
  end

  it "should deserialize a sequence of instructions" do
    stream = @des.getStream([ 1, 0,  0,  1, 2, 3,  3 ])
    stream.getSymbol.should eq(:i1)
    stream.getSymbol.should eq(:i0)
    stream.getSymbol.should eq(:i6)
    stream.getSymbol.should eq(:i9)
  end
  
  it "should ignore unfinished sequences" do
    stream = @des.getStream([ 0, 1, 2 ])
    stream.getSymbol.should eq(:i0)
    stream.getSymbol.should be_nil
  end
  
  it "should return nil for an empty sequence" do
    stream = @des.getStream([]).getSymbol.should be_nil
  end
  
end