# Multiblock

[![Build Status](https://secure.travis-ci.org/monterail/multiblock.png)](http://travis-ci.org/monterail/multiblock)

Ruby methods can accept only one block at a time. Multiblock helps to build multiple-block wrappers that can be passed to Ruby methods in pleasant way.

## Installation

Add this line to your application's Gemfile:

    gem 'multiblock'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multiblock

## Usage

Register blocks simply by calling methods on a multiblock instance and passing actual Ruby callable objects (procs, lamdas, etc.) along:

    multiblock = Multiblock.new
    multiblock.foo { "foo" }
    multiblock.bar { |arg| "bar with #{arg}"}

Then call registered blocks:

    multiblock.call(:foo)
    # => "foo"

    multiblock.call(:bar, "argument")
    # => "bar with argument"

When calling a block under unregistered name `nil` is returned by default:

    multiblock.call(:bar)
    # => nil

But you can supply a block that will be called by default in place of unregistered one:

    multiblock = Multiblock.new { "default" }
    multiblock.call(:bar)
    # => "default"

## Real world example

Multiblock shines in situations when you would like to pass multiple blocks to a method. Perhaps to handle its different outcomes.

Since Ruby methods accepts only one block at a time, we simulate passing multiple blocks with this nice-looking syntax:

    process(message) do |on|
      on.success { puts "ok" }
      on.failure { puts "fail" }
    end

To make it work, let's define `process` method in following way:

    def process(message)
      multiblock = Multiblock.new

      # wrap blocks
      yield(multiblock)

      # do actual processing...

      if result == "success"
        multiblock.call(:success)
      else
        multiblock.call(:failure)
      end
    end

Another example which kinda resembles `respond_with` feature from Ruby on Rails `ActionController`:

    def respond_with(object)
      multiblock = Multiblock.new
      yield(multiblock)

      # assume that request.format returns either 'json' or 'xml'
      multiblock.call(request.format, object)
    end

    respond_with(object) do |format|
      format.xml  { |object| render :xml  => object.to_xml  }
      format.json { |object| render :json => object.to_json }
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
