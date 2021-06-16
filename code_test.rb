require "minitest/autorun"
require_relative "code"

class CodeTest < Minitest::Test
  def test_dest_null
    code = Code.new
    assert_equal("000", code.dest("null"))
  end

  def test_dest_AMD
    code = Code.new
    assert_equal("111", code.dest("AMD"))
  end

  
end