# Open the file with commands
# Initialize a parser with the file

require_relative "parser"
require_relative "code"

class Assembler
  def initialize(input_file)
    @parser = Parser.new(input_file)
    @code = Code.new
  end

  def assemble
  # For each command
    # Advance to command
    # Check command type

    # If :C_COMMAND
      # Get the code for command
    # Else if :A_COMMAND 
      # Turn into "0" + binary 
    # Else  
      # Raise not yet implemented !

    # Print the output
    binary_instructions = []
    while @parser.has_more_commands?
      @parser.advance
      if @parser.command_type == :A_COMMAND
        a_symbol = @parser.symbol 
        binary_instructions << (sprintf("0%015b", a_symbol))
      elsif @parser.command_type == :C_COMMAND
        comp, dest, jump = @parser.comp, @parser.dest, @parser.jump
        comp, dest, jump = @code.comp(comp), @code.dest(dest), @code.jump(jump)
        binary_instructions << "1110#{comp}#{dest}#{jump}"
      end
    end

    binary_instructions.join("\n")
  end
end