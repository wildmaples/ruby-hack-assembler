class SymbolTable
  def initialize
    @symbol_table = {}
  end

  def contains?(symbol)
    @symbol_table.key?(symbol)
  end

  def add_entry(symbol, address)
    @symbol_table[symbol] = address
  end

  def get_address(symbol)
    @symbol_table.fetch(symbol)
  end
end
