require "minitest/autorun"
require_relative "assembler"

class AssemblerTest < Minitest::Test
  def test_assemble_single_A_command
    input_file = StringIO.new("@2")
    assembler = Assembler.new(input_file)
    assert_equal("0000000000000010", assembler.assemble)
  end

  def test_assemble_another_A_command
    input_file = StringIO.new("@3")
    assembler = Assembler.new(input_file)
    assert_equal("0000000000000011", assembler.assemble)
  end

  def test_assemble_multiple_A_commands
    input_file = StringIO.new("@2\n@3")
    assembler = Assembler.new(input_file)
    assert_equal("0000000000000010\n0000000000000011", assembler.assemble)
  end

  def test_assemble_single_C_command
    input_file = StringIO.new("D=A")
    assembler = Assembler.new(input_file)
    assert_equal("1110110000010000", assembler.assemble)
  end

  def test_assemble_single_C_command_with_jump
    input_file = StringIO.new("D=A;JNE")
    assembler = Assembler.new(input_file)
    assert_equal("1110110000010101", assembler.assemble)
  end

  def test_assemble_single_C_command_with_M
    input_file = StringIO.new("D=D+M")
    assembler = Assembler.new(input_file)
    assert_equal("1111000010010000", assembler.assemble)
  end

  def test_assemble_predefined_symbols
    input_file = StringIO.new("@SCREEN")
    assembler = Assembler.new(input_file)
    assert_equal("0100000000000000", assembler.assemble)
  end

  def test_assemble_predefined_symbols_with_numbers
    input_file = StringIO.new("@R10")
    assembler = Assembler.new(input_file)
    assert_equal("0000000000001010", assembler.assemble)
  end

  def test_assemble_a_variable_symbol
    input_file = StringIO.new("@foo")
    assembler = Assembler.new(input_file)
    assert_equal("0000000000010000", assembler.assemble)
  end

  def test_assemble_two_variable_symbols
    input_file = StringIO.new("@foo\n@bar")
    assembler = Assembler.new(input_file)
    assert_equal("0000000000010000\n0000000000010001", assembler.assemble)
  end

  def test_assemble_repeated_variable_symbols
    input_file = StringIO.new("@foo\n@bar\n@foo\n@bar")
    assembler = Assembler.new(input_file)
    assert_equal("0000000000010000\n0000000000010001\n"\
                 "0000000000010000\n0000000000010001", assembler.assemble)
  end
end