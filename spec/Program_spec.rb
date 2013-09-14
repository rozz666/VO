require 'Program'

describe :Program do
  before :each do
    @instructions = [ double("i1"), double("i2"), double("i3") ]
    @program = Program.new @instructions
  end
  it "should start execution from the first instruction" do
    @instructions[0].should_receive(:run)
    @program.step
  end
  it "should execute instructions in order" do
    @instructions[0].should_receive(:run)
    @program.step
    @instructions[1].should_receive(:run)
    @program.step
    @instructions[2].should_receive(:run)
    @program.step
  end
end
