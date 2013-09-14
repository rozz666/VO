require 'World'

describe :World do
  context "with cells" do
    before :each do
      @cells = [ double("cell 1"), double("cell 2"), double("cell 3") ]
      @world = World.new @cells
    end
    context "#step" do
      it "should do a step for each living cell" do
        @cells[0].stub(:dead?) { false }
        @cells[1].stub(:dead?) { false }
        @cells[2].stub(:dead?) { false }
        @cells.each { |c| c.should_receive(:step) }
        @world.step
      end
      it "should remove dead cells" do
        @cells[0].stub(:dead?) { true }
        @cells[1].stub(:dead?) { false }
        @cells[2].stub(:dead?) { true }
        @cells[1].should_receive(:step)
        @world.step
      end
    end
  end
end