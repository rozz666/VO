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
end