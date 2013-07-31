require 'Instructions'

module Instructions
  describe :Instructions do
    before(:each) do
      @environment = double("environment")
      @stack = double("stack")
      @cell = double("cell")
      @cell.stub(:position) { :CELL_POS }
    end
    context :Eat do
      it "should add energy from food and push 1" do
        eat = Eat.new(@environment, @stack, @cell) 
        @environment.should_receive(:getFoodFrom).with(:CELL_POS) { 10 }
        @stack.should_receive(:push).with(1)
        @cell.should_receive(:addEnergy).with(10)
        eat.run
      end
    end
  end
end