require 'TreeDeserializer'

describe :TreeDeserializer do
  
  before(:each) do
    instructions = [ :i0, [ :i1, :i2, [ :i3, :i4, :i5, :i6 ], :i7 ], :i8, :i9 ]
    numbers = [ 7, 8, 9 ]
    @des = TreeDeserializer.new({ :SYMBOL => instructions, :NUMBER => numbers })
  end
  
  it "should deserialize a sequence into a single symbols" do
    @des.getStream([ 0 ]).get(:SYMBOL).should eq(:i0)
    @des.getStream([ 3 ]).get(:SYMBOL).should eq(:i9)
    @des.getStream([ 1, 2, 1 ]).get(:SYMBOL).should eq(:i4)
  end

  it "should deserialize a sequence of symbols" do
    stream = @des.getStream([ 1, 0,  0,  1, 2, 3,  3 ].freeze)
    stream.get(:SYMBOL).should eq(:i1)
    stream.get(:SYMBOL).should eq(:i0)
    stream.get(:SYMBOL).should eq(:i6)
    stream.get(:SYMBOL).should eq(:i9)
  end
  
  it "should ignore unfinished sequences" do
    stream = @des.getStream([ 0, 1, 2 ])
    stream.get(:SYMBOL).should eq(:i0)
    stream.get(:SYMBOL).should be_nil
  end
  
  it "should return nil for an empty sequence" do
    stream = @des.getStream([]).get(:SYMBOL).should be_nil
  end
  
  it "should deserialize symbols using different trees" do
    stream = @des.getStream([ 0, 2 ])
    stream.get(:NUMBER).should eq(7)
    stream.get(:NUMBER).should eq(9)
  end
  
end