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
        @eat.run.should eq(0)
      end
      it "should push 0 if food is not available" do
        @environment.should_receive(:getFoodFrom).with(:CELL_POS) { nil }
        @stack.should_receive(:push).with(0)
        @eat.run.should eq(0)
      end
    end
    context :Store do
      it "should store a value from stack in memory" do
        store = Store.new(@stack, @memory)
        @stack.should_receive(:pop).and_return(:ADDR, :VALUE)
        @memory.should_receive(:storeValueAt).with(:VALUE, :ADDR)
        store.run.should eq(0)
      end
    end
    context :Load do
      it "should push a value from memory" do
        load = Load.new(@stack, @memory)
        @stack.should_receive(:pop).and_return(:ADDR)
        @memory.should_receive(:loadFrom).with(:ADDR) { :VALUE }
        @stack.should_receive(:push).and_return(:VALUE)
        load.run.should eq(0)
      end
    end
    context :Copy do
      it "should copy the cell and put the copy near itself" do
        copy = Copy.new @cell, @environment
        @cell.should_receive(:createCopy) { :COPIED }
        @environment.should_receive(:addCellNear).with(:COPIED, :CELL_POS)
        copy.run.should eq(0)
      end
    end
    context :Skip do
      it "should skip given number of instructions" do
        skip = Skip.new @stack
        @stack.should_receive(:pop) { :N }
        skip.run.should eq(:N)
      end
    end
    context :SkipIf do
      it "should skip given number of instructions if a condition is satisfied" do
        skip = SkipIf.new @stack
        @stack.should_receive(:pop).and_return(1, :N)
        skip.run.should eq(:N)
      end
    end
  end
end