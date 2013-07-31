require 'Deserializer'

describe :Deserializer do
  
  before(:each) do
    instructions = [ :i0, [ :i1, :i2, [ :i3, :i4, :i5, :i6 ], :i7 ], :i8, :i9 ]
    @des = Deserializer.new(instructions)
  end
  
  it "should deserialize a sequence into a single instruction" do
    @des.deserialize([ 0 ]).should eq([ :i0 ])
    @des.deserialize([ 3 ]).should eq([ :i9 ])
    @des.deserialize([ 1, 2, 1 ]).should eq([ :i4 ])
  end

  it "should deserialize a sequence of instructions" do
    @des.deserialize([ 1, 0,  0,  1, 2, 3,  3 ]).should eq([ :i1, :i0, :i6, :i9 ])
  end
  
  it "should ignore unfinished sequences" do
    @des.deserialize([ 0, 1, 2 ]).should eq([ :i0 ])
  end
  
end