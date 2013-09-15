require 'CellCloner'

describe :CellCloner do
  before :each do
    @instructionFactory = double("instruction factory")
    @deserializer = double("deserializer")
    @cloner = CellCloner.new @deserializer, @instructionFactory
  end
  it "should create a cell from genetic code" do
    stream = double("stream")
    @deserializer.should_receive(:getStream).with(:GC) { stream }
    stream.should_receive(:get).with(:SYMBOL).and_return(:A, :B, nil)
    @instructionFactory.should_receive(:create).with(:A, stream) { :i1 }
    @instructionFactory.should_receive(:create).with(:B, stream) { :i2 }
    @cloner.clone(:GC).should eq [ :i1, :i2 ]
  end
end