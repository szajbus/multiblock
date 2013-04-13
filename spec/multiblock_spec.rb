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

  it "should return the default when calling without a previously defined block" do
    expect( multiblock.bar ).to eq(nil)
  end

  it "should call the previously defined block if called without a block" do
    multiblock.bar { |arg| arg }
    expect( multiblock.bar("foo") ).to eq("foo")
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
