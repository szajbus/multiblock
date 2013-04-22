require "spec_helper"

describe Multiblock do
  it "should construct wrapper" do
    described_class.wrapper.inspect.should =~ /Multiblock::Wrapper/
  end

  it "should construct wrapper with custom default block" do
    wrapper = described_class.wrapper { "foo" }
    wrapper.call(:bar).should == "foo"
  end
end
