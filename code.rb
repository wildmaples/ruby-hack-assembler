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

  def dest(mnemonic)
    DEST_CODE[mnemonic]
  end
end