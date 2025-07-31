class AssemblyLine
  PRODUCTION_PER_HOUR = 221

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    cars_produced_per_hour = @speed * PRODUCTION_PER_HOUR

    if @speed.between?(1, 4)
      success_rate = 1
    elsif @speed.between?(5, 8)
      success_rate = 0.9
    elsif @speed == 9
      success_rate = 0.8
    else
      success_rate = 0.77
    end

    cars_produced_per_hour * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
