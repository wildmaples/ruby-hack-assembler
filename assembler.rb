# Open the file with commands
# Initialize a parser with the file

require_relative "parser"

class Assembler
  def initialize(input_file)
    @parser = Parser.new(input_file)
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
    @parser.advance
    a_symbol = @parser.symbol 
    sprintf("0%015b", a_symbol)
  end
end

