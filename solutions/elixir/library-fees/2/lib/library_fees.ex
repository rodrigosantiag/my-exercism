defmodule LibraryFees do
  @spec datetime_from_string(String.t()) :: NaiveDateTime.t()
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  @spec before_noon?(NaiveDateTime.t()) :: boolean()
  def before_noon?(datetime) do
    datetime.hour < 12
  end

  @spec return_date(NaiveDateTime.t()) :: Date.t()
  def return_date(checkout_datetime) do
    added_days = if before_noon?(checkout_datetime), do: 28, else: 29
    NaiveDateTime.to_date(NaiveDateTime.add(checkout_datetime, added_days, :day))
  end

  @spec days_late(Date.t(), NaiveDateTime.t()) :: non_neg_integer()
  def days_late(planned_return_date, actual_return_datetime) do
    actual_return_date = NaiveDateTime.to_date(actual_return_datetime)
    max(0, Date.diff(actual_return_date, planned_return_date))
  end

  @spec monday?(NaiveDateTime.t()) :: boolean()
  def monday?(datetime) do
    NaiveDateTime.to_date(datetime)
    |> Date.day_of_week() == 1
  end

  @spec calculate_late_fee(String.t(), String.t(), integer()) :: integer()
  def calculate_late_fee(checkout, return, rate) do
    checkout_datetime = datetime_from_string(checkout)
    planend_return = return_date(checkout_datetime)
    actual_return = datetime_from_string(return)
    late_in_days = days_late(planend_return, actual_return)
    discount = if monday?(actual_return), do: 0.5, else: 1
    floor(late_in_days * rate * discount)
  end
end
