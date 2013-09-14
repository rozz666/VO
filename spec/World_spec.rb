require 'World'

describe :World do
  context "with cells" do
    before :each do
      @cells = [ double("cell 1"), double("cell 2") ]
      @world = World.new @cells
    end
    context "#step" do
      it "should do a step for each cell" do
        @cells.each { |c| c.should_receive(:step) }
        @world.step
      end
    end
  end
end