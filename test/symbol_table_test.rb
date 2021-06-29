require "test_helper"
require "symbol_table"

class SymbolTableTest < Minitest::Test
  def test_add_entry_adds_symbol_and_address
    symbol_table = SymbolTable.new
    refute(symbol_table.contains?("LOOP"))
    symbol_table.add_entry("LOOP", 5)
    assert(symbol_table.contains?("LOOP"))
  end

  def test_get_address_returns_the_address
    symbol_table = SymbolTable.new
    symbol_table.add_entry("LOOP", 5)
    assert_equal(5, symbol_table.get_address("LOOP"))
  end

  def test_multiple_entries_with_same_key
    symbol_table = SymbolTable.new
    symbol_table.add_entry("LOOP", 5)
    symbol_table.add_entry("LOOP", 6)
    assert_equal(6, symbol_table.get_address("LOOP"))
  end
end
