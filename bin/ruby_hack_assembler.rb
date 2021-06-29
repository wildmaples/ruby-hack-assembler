#!/usr/bin/env ruby

# Run `bin/ruby_hack_assembler.rb examples/add.asm`

require_relative '../lib/assembler'

input_file = File.open(ARGV[0].to_s)
puts Assembler.new(input_file).assemble
