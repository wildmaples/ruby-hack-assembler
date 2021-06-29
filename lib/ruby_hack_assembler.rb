#!/usr/bin/env ruby

# Run `lib/ruby_hack_assembler.rb examples/add.asm`

require_relative 'assembler'

input_file = File.open(ARGV[0].to_s)
puts Assembler.new(input_file).assemble
