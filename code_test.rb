require_relative "test_helper"
require_relative "code"

class CodeTest < Minitest::Test
  def setup
    @code = Code.new
  end

  def test_dest_null
    assert_equal("000", @code.dest("null"))
  end

  def test_dest_AMD
    assert_equal("111", @code.dest("AMD"))
  end

  def test_jump_null
    assert_equal("000", @code.jump("null"))
  end

  def test_jump_JNE
    assert_equal("101", @code.jump("JNE"))
  end

  def test_comp_NOT_M
    assert_equal("1110001", @code.comp("!M"))
  end

  def test_comp_D_MINUS_1
    assert_equal("0001110", @code.comp("D-1"))
  end

  def test_comp_0
    assert_equal("0101010", @code.comp("0"))
  end
end
