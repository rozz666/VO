require 'Instructions'

module Instructions
  describe :Instructions do
    before(:each) do
      @environment = double("environment")
      @stack = double("stack")
      @memory = double("stack")
      @cell = double("cell")
      @cell.stub(:position) { :CELL_POS }
    end
    context :Eat do
      before(:each) do
        @eat = Eat.new(@environment, @stack, @cell) 
      end
      it "should add energy from food and push 1" do
        @environment.should_receive(:getFoodFrom).with(:CELL_POS) { 10 }
        @stack.should_receive(:push).with(1)
        @cell.should_receive(:addEnergy).with(10)
        @eat.run
      end
      it "should push 0 if food is not available" do
        @environment.should_receive(:getFoodFrom).with(:CELL_POS) { nil }
        @stack.should_receive(:push).with(0)
        @eat.run
      end
    end
    context :Store do
      it "should store a value from stack in memory" do
        @stack.should_receive(:pop).and_return(:ADDR, :VALUE)
        @memory.should_receive(:storeValueAt).with(:VALUE, :ADDR)
        store = Store.new(@stack, @memory)
        store.run
      end
    end
    context :Load do
      it "should push a value from memory" do
        load = Load.new(@stack, @memory)
        @stack.should_receive(:pop).and_return(:ADDR)
        @memory.should_receive(:loadFrom).with(:ADDR) { :VALUE }
        @stack.should_receive(:push).and_return(:VALUE)
        load.run
      end
    end
  end
end