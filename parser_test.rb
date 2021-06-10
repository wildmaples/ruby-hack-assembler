require "minitest/autorun"
require_relative "parser"

class ParserTest < Minitest::Test
  def test_that_has_more_commands_returns_false_when_no_commands
    input_file = StringIO.new
    parser = Parser.new(input_file)
    refute(parser.has_more_commands?)
  end

  def test_that_has_more_commands_returns_true_when_commands_available
    input_file = StringIO.new("@2")
    parser = Parser.new(input_file)
    assert(parser.has_more_commands?)
  end

  def test_command_type_returns_A_COMMAND_if_command_is_A_COMMAND
    input_file = StringIO.new("@2")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal(parser.command_type, :A_COMMAND)
  end

  def test_command_type_returns_C_COMMAND_if_command_is_C_COMMAND
    input_file = StringIO.new("D=A")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal(parser.command_type, :C_COMMAND)
  end

  def test_command_type_returns_L_COMMAND_if_command_is_L_COMMAND
    input_file = StringIO.new("(LOOP)")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal(parser.command_type, :L_COMMAND)
  end
end
