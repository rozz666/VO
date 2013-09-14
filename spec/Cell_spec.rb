require 'Cell'

describe :Cell do
  context "with no energy" do
    before :each do
      @cell = Cell.new 0
    end
    it "should be dead" do
      @cell.should be_dead
    end
  end
  context "with energy" do
    before :each do
      @cell = Cell.new 3
    end
    it "should be alive" do
      @cell.should_not be_dead
    end
    context "#step" do
      it "should decrease its energy" do
        @cell.step
        @cell.energy.should eq 2
      end
    end
  end
end