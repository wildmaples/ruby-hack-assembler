require "minitest/autorun"

class RubyHackAssemblerTest < Minitest::Test
  def test_integration_test
    skip("Assembly with symbols hasn't been implemented!")
    assembly_code = `ruby ruby_hack_assembler.rb examples/Rect.asm`
    expected = <<~EOF
      0000000000000000
      1111110000010000
      0000000000010111
      1110001100000110
      0000000000010000
      1110001100001000
      0100000000000000
      1110110000010000
      0000000000010001
      1110001100001000
      0000000000010001
      1111110000100000
      1110111010001000
      0000000000010001
      1111110000010000
      0000000000100000
      1110000010010000
      0000000000010001
      1110001100001000
      0000000000010000
      1111110010011000
      0000000000001010
      1110001100000001
      0000000000010111
      1110101010000111
    EOF

    assert_equal(expected, assembly_code)
  end

  def test_integration_test_symboless
    assembly_code = `ruby ruby_hack_assembler.rb examples/Add.asm`
    expected = <<~EOF
      0000000000000010
      1110110000010000
      0000000000000011
      1110000010010000
      0000000000000000
      1110001100001000
    EOF

    assert_equal(expected, assembly_code)
  end
end