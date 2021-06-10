class Parser
  def initialize(input_file)
    @lines = input_file.readlines
  end

  def has_more_commands?
    !@lines.empty?
  end

  def advance
    @command = @lines.shift
  end

  def command_type
    if @command.start_with?("@")
      :A_COMMAND
    elsif @command.start_with?("(")
      :L_COMMAND
    else
      :C_COMMAND
    end
  end
end
