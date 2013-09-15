require 'CellCloner'

describe :CellCloner do
  before :each do
    @instructionFactory = double("instruction factory")
    deserializer = double("deserializer")
    @cloner = CellCloner.new deserializer, @instructionFactory

    @stream = double("stream")
    deserializer.should_receive(:getStream).with(:GC) { @stream }
  end
  it "should create a cell from genetic code" do
    @stream.should_receive(:get).with(:SYMBOL).and_return(:A, :B, nil)
    @instructionFactory.should_receive(:create).with(:A, @stream) { :i1 }
    @instructionFactory.should_receive(:create).with(:B, @stream) { :i2 }
    @cloner.clone(:GC).should eq [ :i1, :i2 ]
  end
  it "should finish deserializing instructions after first fail" do
    @stream.stub(:get).and_return(:A, :B, :C, nil)
    @instructionFactory.should_receive(:create).and_return(:i1, nil)
    @cloner.clone(:GC).should eq [ :i1 ]
  end
  it "should return no instructions for an empty stream" do
    @stream.stub(:get){ nil }
    @cloner.clone(:GC).should be_empty
  end
end