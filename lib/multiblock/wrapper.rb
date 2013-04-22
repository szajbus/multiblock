module Multiblock
  class Wrapper < BasicObject
    def initialize(&default)
      default ||= ::Kernel.lambda { |*args| nil }

      @blocks = ::Hash.new(default)
    end

    def method_missing(name, *args, &blk)
      ::Kernel.raise ::ArgumentError.new("No block given when registering '#{name}' block.") if blk.nil?
      @blocks[name.to_s] = blk
    end

    def call(name, *args)
      @blocks[name.to_s].call(*args)
    end

    def inspect
      "#<Multiblock::Wrapper @blocks=#{@blocks.inspect}>"
    end
  end
end

