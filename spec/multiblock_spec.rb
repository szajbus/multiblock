require "spec_helper"

describe Multiblock do
  it "should construct wrapper" do
    described_class.wrapper.should be_instance_of(Multiblock::Wrapper)
  end
end
