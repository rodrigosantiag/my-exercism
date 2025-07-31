defmodule FreelancerRates do
  @hours_in_a_workday 8.0
  @workdays_in_a_month 22

  def daily_rate(hourly_rate), do: hourly_rate * @hours_in_a_workday / 1

  def apply_discount(before_discount, discount), do: before_discount - (before_discount * discount / 100)

  def monthly_rate(hourly_rate, discount) do
    @workdays_in_a_month * daily_rate(hourly_rate) |> apply_discount(discount) |> ceil
  end

  def days_in_budget(budget, hourly_rate, discount) do
    budget / (daily_rate(hourly_rate) |> apply_discount(discount)) |> Float.floor(1)
  end
end
