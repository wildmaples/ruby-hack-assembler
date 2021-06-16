class Code
  DEST_CODE = {
    "null" => "000",
    "M" => "001",
    "D" => "010",
    "MD" => "011",
    "A" => "100",
    "AM" => "101",
    "AD" => "110",
    "AMD" => "111",
  }

  JUMP_CODE = {
    "null" => "000",
    "JGT" => "001",
    "JEQ" => "010",
    "JGE" => "011",
    "JLT" => "100",
    "JNE" => "101",
    "JLE" => "110",
    "JMP" => "111",
  }

  def dest(mnemonic)
    DEST_CODE[mnemonic]
  end

  def jump(mnemonic)
    JUMP_CODE[mnemonic]
  end
end