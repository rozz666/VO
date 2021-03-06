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
      before(:each) do
        @skip = SkipIf.new @stack
      end
      it "should skip given number of instructions if a condition is satisfied" do
        @stack.should_receive(:pop).and_return(1, :N)
        @skip.run.should eq(:N)
      end
      it "should not skip given number of instructions if a condition is not satisfied" do
        @stack.should_receive(:pop).and_return(0, :N)
        @skip.run.should eq(0)
      end
    end
    context :Swap do
      it "should swap two values from the stack" do
        swap = Swap.new @stack
        @stack.should_receive(:pop).ordered  { :A }
        @stack.should_receive(:pop).ordered  { :B }
        @stack.should_receive(:push).with(:A).ordered
        @stack.should_receive(:push).with(:B).ordered
        swap.run.should eq(0)
      end
    end
    context :Push do
      it "should push a constant" do
        push = Push.new @stack, :VALUE
        @stack.should_receive(:push).with(:VALUE)
        push.run.should eq(0)
      end
    end
    context :Pop do
      it "should pop a value" do
        pop = Pop.new @stack
        @stack.should_receive(:pop)
        pop.run.should eq(0)
      end
    end
    context :Dup do
      it "should duplicate a value" do
        dup = Dup.new @stack
        @stack.should_receive(:pop).and_return(:VALUE)
        @stack.should_receive(:push).with(:VALUE).twice
        dup.run.should eq(0)
      end
    end
    context :Add do
      it "should add two value from the stack and put the result on the stack" do
        add = Add.new @stack
        @stack.should_receive(:pop) { 7 }
        @stack.should_receive(:pop) { 9 }
        @stack.should_receive(:push).with(16)
        add.run.should eq(0)
      end
    end
    context :Mul do
      it "should multiply two values from the stack and put the result on the stack" do
        mul = Mul.new @stack
        @stack.should_receive(:pop) { 3 }
        @stack.should_receive(:pop) { 5 }
        @stack.should_receive(:push).with(15)
        mul.run.should eq(0)
      end
    end
    context :Neg do
      it "should negate the value on top of the stack" do
        neg = Neg.new @stack
        @stack.should_receive(:pop) { 3 }
        @stack.should_receive(:push).with(-3)
        neg.run.should eq(0)
      end
    end
    context :Inv do
      it "should invert the value on top of the stack" do
        inv = Inv.new @stack
        @stack.should_receive(:pop) { 3.0 }
        @stack.should_receive(:push) do |val|
          val.should be_within(0.00001).of(0.33333)
        end
        inv.run.should eq(0)
      end
    end
    context :Movf do
      it "should move the cell forward" do
        movf = Movf.new @cell
        @cell.should_receive(:moveForward)
        movf.run.should eq(0)
      end
    end
    context :Rotl do
      it "should turn the cell to the left" do
        rotl = Rotl.new @cell
        @cell.should_receive(:turnLeft)
        rotl.run.should eq(0)
      end
    end
    context :Rotr do
      it "should turn the cell to the left" do
        rotr = Rotr.new @cell
        @cell.should_receive(:turnRight)
        rotr.run.should eq(0)
      end
    end
    context :Eq do
      before(:each) {
        @eq = Eq.new @stack
      }
      it "should push 1 if two values are equal" do
        @stack.should_receive(:pop) { 7 }
        @stack.should_receive(:pop) { 7 }
        @stack.should_receive(:push).with(1)
        @eq.run.should eq(0)
      end
      it "should push 0 if two values are not equal" do
        @stack.should_receive(:pop) { 7 }
        @stack.should_receive(:pop) { 8 }
        @stack.should_receive(:push).with(0)
        @eq.run.should eq(0)
      end
    end
    context :Eq do
      before(:each) {
        @lt = Lt.new @stack
      }
      it "should push 0 if two values are equal" do
        @stack.should_receive(:pop) { 7 }
        @stack.should_receive(:pop) { 7 }
        @stack.should_receive(:push).with(0)
        @lt.run.should eq(0)
      end
      it "should push 0 if top value is grater than the value below" do
        @stack.should_receive(:pop) { 9 }
        @stack.should_receive(:pop) { 7 }
        @stack.should_receive(:push).with(0)
        @lt.run.should eq(0)
      end
      it "should push 1 if top value is less than the value below" do
        @stack.should_receive(:pop) { 5 }
        @stack.should_receive(:pop) { 6 }
        @stack.should_receive(:push).with(1)
        @lt.run.should eq(0)
      end
    end
    context :Sense do
      it "should detect obstacles and push the obstacle ratio" do
        sense = Sense.new @environment, @stack
        @stack.should_receive(:pop) { :DIRECTION }
        @environment.should_receive(:detectObstacles).with(:DIRECTION) { :RATIO }
        @stack.should_receive(:push) { :RATIO }
        sense.run.should eq(0)
      end
    end
  end
end