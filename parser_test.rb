require_relative "test_helper"
require "parser"

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

  def test_advance_lines_twice
    input_file = StringIO.new("@2\nD=A")
    parser = Parser.new(input_file)
    assert(parser.has_more_commands?)
    parser.advance
    parser.advance
    refute(parser.has_more_commands?)
  end

  def test_symbol_for_A_COMMAND
    input_file = StringIO.new("@25")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal("25", parser.symbol)
  end

  def test_symbol_for_L_COMMAND
    input_file = StringIO.new("(LOOP)")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal("LOOP", parser.symbol)
  end

  def test_dest_for_C_COMMAND
    input_file = StringIO.new("D=A")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal("D", parser.dest)
  end

  def test_dest_null
    input_file = StringIO.new("0;JMP")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal("null", parser.dest)
  end

  def test_comp_with_equal_sign
    input_file = StringIO.new("D=D-M")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal("D-M", parser.comp)
  end

  def test_comp_with_semi_colon
    input_file = StringIO.new("D&M;JMP")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal("D&M", parser.comp)
  end

  def test_comp_with_equal_sign_and_semi_colon
    input_file = StringIO.new("D=D-M;JMP")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal("D-M", parser.comp)
  end

  def test_jump_with_jump
    input_file = StringIO.new("D&M;JLE")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal("JLE", parser.jump)
  end

  def test_jump_no_jump
    input_file = StringIO.new("D&M")
    parser = Parser.new(input_file)
    parser.advance
    assert_equal("null", parser.jump)
  end

  def test_comments_in_input_file
    input_file = StringIO.new("// comment\nD&M")
    parser = Parser.new(input_file)

    assert(parser.has_more_commands?)
    parser.advance

    assert_equal("D&M", parser.comp)
    assert_equal(:C_COMMAND, parser.command_type)
    refute(parser.has_more_commands?)
  end

  def test_inline_comments_in_input_file
    input_file = StringIO.new("@1234 // in-line comment")
    parser = Parser.new(input_file)

    assert(parser.has_more_commands?)
    parser.advance

    assert_equal("1234", parser.symbol)
    assert_equal(:A_COMMAND, parser.command_type)
    refute(parser.has_more_commands?)
  end

  def test_blank_lines_in_input_file
    input_file = StringIO.new("\n\nD&M\n\n")
    parser = Parser.new(input_file)

    assert(parser.has_more_commands?)
    parser.advance

    assert_equal("D&M", parser.comp)
    assert_equal(:C_COMMAND, parser.command_type)
    refute(parser.has_more_commands?)
  end
end
