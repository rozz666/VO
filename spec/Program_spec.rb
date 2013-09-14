require 'Program'

describe :Program do
  before :each do
    @instructions = (1..6).map { |n| double("i#{n}") }
    @program = Program.new @instructions
  end
  it "should start execution from the first instruction" do
    @instructions[0].should_receive(:run) { 0 }
    @program.step
  end
  it "should execute instructions in order" do
    @instructions[0].should_receive(:run) { 0 }
    @program.step
    @instructions[1].should_receive(:run) { 0 }
    @program.step
    @instructions[2].should_receive(:run) { 0 }
    @program.step
  end
  it "should change its instruction index by the value return by the previously executed instruction" do
    @instructions[0].should_receive(:run) { 3 }
    @program.step
    @instructions[1 + 3].should_receive(:run) { 0 }
    @program.step
  end
  it "should restart when instruction index gets negative" do
    @instructions[0].should_receive(:run) { 4 }
    @instructions[5].should_receive(:run) { -2 }
    @instructions[4].should_receive(:run) { -6 }
    3.times { @program.step }
    @instructions[0].should_receive(:run) { 0 }
    @program.step
  end
  it "should restart when instruction index gets past the program size" do
    @instructions[0].should_receive(:run).and_return(@instructions.count - 1, @instructions.count, 0)
    3.times { @program.step }
  end
end
