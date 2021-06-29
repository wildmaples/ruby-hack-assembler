# Run `ruby ruby_hack_assembler.rb examples/add.asm`

require_relative 'assembler'

puts Assembler.new(ARGF).assemble