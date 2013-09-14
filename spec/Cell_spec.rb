require 'Cell'

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
      @cell = Cell.new 3, :GC, @cloner
    end
    it "should be alive" do
      @cell.should_not be_dead
    end
    context "#step" do
      it "should decrease its energy" do
        @cell.step
        @cell.energy.should eq 2
      end
      it "should kill the cell when its energy is drained" do
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
  end
end
