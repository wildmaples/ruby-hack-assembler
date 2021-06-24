require_relative "parser"
require_relative "code"
require_relative "symbol_table"

class Assembler
  def initialize(input_file)
    @parser = Parser.new(input_file)
    @code = Code.new
    @symbol_table = SymbolTable.new
    add_predefined_symbols
  end

  def add_predefined_symbols
    @symbol_table.add_entry("SCREEN", 16384)
  end

  def assemble
    binary_instructions = []
    while @parser.has_more_commands?
      @parser.advance
      if @parser.command_type == :A_COMMAND
        a_symbol = @parser.symbol 
        
        if @symbol_table.contains?(a_symbol)
          a_symbol = @symbol_table.get_address(a_symbol)
        end
        
        binary_instructions << (sprintf("0%015b", a_symbol))
      elsif @parser.command_type == :C_COMMAND
        comp, dest, jump = @parser.comp, @parser.dest, @parser.jump
        comp, dest, jump = @code.comp(comp), @code.dest(dest), @code.jump(jump)
        binary_instructions << "111#{comp}#{dest}#{jump}"
      end
    end

    binary_instructions.join("\n")
  end
end