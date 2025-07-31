class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    message = split_log_line[1]
    message.strip
  end

  def log_level
    level = split_log_line[0]
    level.gsub(/[\[\]]/, '').downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end

  def split_log_line
    @line.split(":")
  end
end
