#!/usr/bin/env ruby

require "optparse"
require "bundler/inline"

gemfile do
  # some gems
done

class Klass
end

Klass.run(ARGF)
