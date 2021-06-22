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
end