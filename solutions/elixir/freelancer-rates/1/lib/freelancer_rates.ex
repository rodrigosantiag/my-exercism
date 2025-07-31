defmodule FreelancerRates do
  @hours_in_a_workday 8
  @workdays_in_a_month 22

  def daily_rate(hourly_rate), do: hourly_rate * @hours_in_a_workday / 1

  def apply_discount(before_discount, discount), do: before_discount - (before_discount * discount / 100)

  def monthly_rate(hourly_rate, discount) do
    rate = daily_rate(hourly_rate)
    rate_with_discount = apply_discount(rate, discount)
    rounded_up_rate = Float.ceil(rate_with_discount * @workdays_in_a_month)

    trunc(rounded_up_rate)
  end

  def days_in_budget(budget, hourly_rate, discount) do
    rate = daily_rate(hourly_rate)
    rate_with_discount = apply_discount(rate, discount)

    Float.floor(budget / rate_with_discount, 1)
  end
end
