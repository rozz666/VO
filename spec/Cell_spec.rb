require 'Cell'
require 'matrix'

describe :Cell do
  context "with no energy" do
    before :each do
      @cell = Cell.new 0, nil, nil
    end
    it "should be dead" do
      @cell.should be_dead
    end
  end
  context "with energy" do
    before :each do
      @cloner = double("cloner")
      @program = double("program")
      @cell = Cell.new 3, :GC, @cloner
      @cell.program = @program
    end
    it "should be alive" do
      @cell.should_not be_dead
    end
    context "#step" do
      it "should decrease its energy and do a step for its program" do
        @program.should_receive(:step)
        @cell.step
        @cell.energy.should eq 2
      end
      it "should kill the cell when its energy is drained" do
        @program.stub(:step)
        3.times { @cell.step }
        @cell.should be_dead
      end
    end
    context "#addEnergy" do
      it "should increase energy by the given amount" do
        @cell.addEnergy 7
        @cell.addEnergy 4
        @cell.energy.should eq 14
      end
    end
    it "should have a mutable position" do
      @cell.position = :POS
      @cell.position.should eq :POS
    end
    context "#createCopy" do
      it "should clone the cell" do
        @cloner.should_receive(:clone).with(:GC) { :NEW_CELL }
        @cell.createCopy.should be :NEW_CELL
      end
    end
    it "should have default direction up" do
      @cell.position = Vector[3, 4]
      @cell.moveForward
      @cell.position.should eq Vector[3, 5]
      @cell.moveForward
      @cell.position.should eq Vector[3, 6]
    end
    context "#turnLeft" do
      it "should rotate the direction counterclockwise" do
        @cell.position = Vector[1, 2]
        @cell.rotateLeft
        @cell.moveForward
        @cell.position.should eq Vector[0, 2]
        @cell.rotateLeft
        @cell.moveForward
        @cell.position.should eq Vector[0, 1]
      end
    end
    context "#turnRight" do
      it "should rotate the direction clockwise" do
        @cell.position = Vector[1, 2]
        @cell.rotateRight
        @cell.moveForward
        @cell.position.should eq Vector[2, 2]
        @cell.rotateRight
        @cell.moveForward
        @cell.position.should eq Vector[2, 1]
      end
    end
  end
end
