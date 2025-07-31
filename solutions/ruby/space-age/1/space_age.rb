class SpaceAge
  def initialize(age_seconds)
    @age_seconds = age_seconds
  end

  def on_earth
    calculate_age_by_factor 1
  end

  def on_mercury
    calculate_age_by_factor 0.2408467
  end

  def on_venus
    calculate_age_by_factor 0.61519726
  end

  def on_mars
    calculate_age_by_factor 1.8808158
  end

  def on_jupiter
    calculate_age_by_factor 11.862615
  end

  def on_saturn
    calculate_age_by_factor 29.447498
  end

  def on_uranus
    calculate_age_by_factor 84.016846
  end

  def on_neptune
    calculate_age_by_factor 164.79132
  end

  private

  def calculate_age_by_factor(factor)
    year_in_seconds = 31_557_600

    (@age_seconds.to_f / year_in_seconds / factor).round(2)
  end
end
