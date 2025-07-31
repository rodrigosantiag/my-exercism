class Clock
  attr_reader :hours, :minutes

  def initialize(hour: 0, minute: 0)
    @hours = hour
    @minutes = minute
    normalize_time
  end

  def +(other)
    Clock.new(hour: @hours + other.hours, minute: @minutes + other.minutes)
  end

  def -(other)
    Clock.new(hour: @hours - other.hours, minute: @minutes - other.minutes)
  end

  def ==(other)
    @hours == other.hours && @minutes == other.minutes
  end

  def to_s
    format('%<hour>.2d:%<minute>.2d', hour: @hours, minute: @minutes)
  end

  private

  def normalize_time
    total_minutes = @hours * 60 + @minutes
    @hours = total_minutes / 60 % 24
    @minutes = total_minutes % 60
  end
end
