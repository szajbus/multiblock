require "spec_helper"

describe Multiblock do
  it "should construct wrapper" do
    described_class.wrapper.class.should == Multiblock::Wrapper
  end
end
