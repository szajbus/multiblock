require "blankslate"

class Multiblock < BlankSlate
  def initialize(&default)
    default ||= lambda { |*args| nil }

    @blocks = Hash.new(default)
  end

  def method_missing(name, *args, &blk)
    raise ArgumentError.new("No block given when registering '#{name}' block.") unless block_given?
    @blocks[name.to_s] = blk
  end

  def call(name, *args)
    @blocks[name.to_s].call(*args)
  end
end
