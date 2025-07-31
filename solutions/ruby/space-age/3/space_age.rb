# frozen_string_literal: true

class SpaceAge
  def initialize(age_seconds)
    @age_seconds = age_seconds
  end

  {
    earth: 1.0,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.each do |planet, factor|
    define_method :"on_#{planet}" do
      calculate_age_by_factor factor
    end
  end

  private

  def calculate_age_by_factor(factor)
    year_in_seconds = 31_557_600

    (@age_seconds.to_f / year_in_seconds / factor).round(2)
  end
end
