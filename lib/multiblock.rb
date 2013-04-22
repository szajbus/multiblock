module Multiblock
  class << self
    def wrapper(*args)
      Wrapper.new(*args)
    end
  end
end

require "multiblock/wrapper"
