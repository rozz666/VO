require 'InstructionDeserializer'

describe :InstructionDeserializer do
  before :each do
    @instructionFactory = double("instruction factory")
    @cloner = InstructionDeserializer.new @instructionFactory
    @stream = double("stream")
  end
  it "should create a cell from genetic code" do
    @stream.should_receive(:get).with(:SYMBOL).and_return(:A, :B, nil)
    @instructionFactory.should_receive(:create).with(:A, @stream) { :i1 }
    @instructionFactory.should_receive(:create).with(:B, @stream) { :i2 }
    @cloner.deserialize(@stream).should eq [ :i1, :i2 ]
  end
  it "should finish deserializing instructions after first fail" do
    @stream.stub(:get).and_return(:A, :B, :C, nil)
    @instructionFactory.should_receive(:create).and_return(:i1, nil)
    @cloner.deserialize(@stream).should eq [ :i1 ]
  end
  it "should return no instructions for an empty stream" do
    @stream.stub(:get){ nil }
    @cloner.deserialize(@stream).should be_empty
  end
  it "should return no instructions if creating the first instruction fails" do
    @stream.stub(:get).and_return(:A, nil)
    @instructionFactory.should_receive(:create) { nil }
    @cloner.deserialize(@stream).should be_empty
  end
end