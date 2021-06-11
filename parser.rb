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

  def symbol
    if command_type == :A_COMMAND
      @command[1..-1]
    elsif command_type == :L_COMMAND
      @command[1..-2]
    end
  end

  def dest
    if @command.include?("=")
      @command.split("=").first
    else
      "null"
    end
  end

  def comp
    @command
      .split("=").last
      .split(";").first
  end

  def jump
    if @command.include?(";")
      @command.split(";").last
    else
      "null"
    end
  end
end
