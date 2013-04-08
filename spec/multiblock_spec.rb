require "spec_helper"

describe Multiblock do

  let(:multiblock) {
    Multiblock.new
  }

  it "should register block" do
    multiblock.foo { "foo" }
    multiblock.call(:foo).should == "foo"
  end

  it "should call registered block by String" do
    multiblock.foo { "foo" }
    multiblock.call("foo").should == "foo"
  end

  it "should return nil when calling unregistered block" do
    multiblock.call(:foo).should be_nil
  end

  it "should return nil when calling unregistered block with arguments" do
    multiblock.call(:foo).should be_nil
  end

  it "should pass arguments to called block" do
    multiblock.foo { |arg| arg }
    multiblock.call(:foo, "foo").should == "foo"
  end

  it "should raise ArgumentError exception when registering without block" do
    lambda {
      multiblock.foo
    }.should raise_exception(ArgumentError, "No block given when registering 'foo' block.")
  end

  context "with custom default block" do
    let(:multiblock) {
      Multiblock.new { "default" }
    }

    it "should call custom default block when calling unregistered block" do
      multiblock.call(:foo).should == "default"
    end
  end
end
