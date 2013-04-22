require "spec_helper"

describe Multiblock::Wrapper do

  let(:wrapper) {
    described_class.new
  }

  it "should register block" do
    wrapper.foo { "foo" }
    wrapper.call(:foo).should == "foo"
  end

  it "should call registered block by String" do
    wrapper.foo { "foo" }
    wrapper.call("foo").should == "foo"
  end

  it "should return nil when calling unregistered block" do
    wrapper.call(:foo).should be_nil
  end

  it "should return nil when calling unregistered block with arguments" do
    wrapper.call(:foo).should be_nil
  end

  it "should pass arguments to called block" do
    wrapper.foo { |arg| arg }
    wrapper.call(:foo, "foo").should == "foo"
  end

  it "should raise ArgumentError exception when registering without block" do
    lambda {
      wrapper.foo
    }.should raise_exception(ArgumentError, "No block given when registering 'foo' block.")
  end

  context "with custom default block" do
    let(:wrapper) {
      described_class.new { "default" }
    }

    it "should call custom default block when calling unregistered block" do
      wrapper.call(:foo).should == "default"
    end
  end
end
