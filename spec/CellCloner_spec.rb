require 'CellCloner'

describe :CellCloner do
  before :each do
    @cellFactory = double("cell factory")
    @programDeserializer = double("program deserializer")
    @cloner = CellCloner.new(@cellFactory, @programDeserializer, :initialEnergy)
  end
  it "should create a new cell from genetic code" do
    @cellFactory.should_receive(:create).with(:initialEnergy, :GC, @cloner) { :cell }
    @programDeserializer.should_receive(:deserialize).with(:GC, :cell)
    @cloner.clone(:GC).should be(:cell)
  end
end