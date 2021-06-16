require "minitest/autorun"
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
end