"""Functions to help the company calculate their power usage."""


def get_extra_hours(hours):
    """Return the amount of hours.

    :param: hours: int - amount of hours.
    :return: int - amount of "extra" hours.
    """
    hours_in_a_day = 24
    adjustment_value = 3
    total_hours = hours + adjustment_value
    days = total_hours // hours_in_a_day
    extra_hours = total_hours - hours_in_a_day * days

    return extra_hours


def get_kW_amount(watts):
    """Return the kW amount of a given watt amount.

    :param: watts: int - watt amount.
    :return: float - kW amount.
    """
    one_kw = 1000

    return round(watts / one_kw, 1)


def get_kwh_amount(watts):
    """Return the kWh amount of a given watt amount and hours.

    :param: watts: int - watt amount.
    :return: int - kilowatt hour amount.
    """
    return get_kW_amount(watts) // 3600


def get_efficiency(power_factor):
    """Return the efficiency calculated from the power factor.

    :param: power_factor: float.
    :return: float - efficiency.
    """
    return power_factor / 100


def get_cost(watts, power_factor, price):
    """Calculate the cost of a given kWh value, efficiency and price.

    :param: watts: int - watt value.
    :param: power_factor: float - efficiency.
    :param: price: float - price of kWh.
    :return: float - cost of kWh.
    """
    kwh = get_kwh_amount(watts)
    power_efficiency = get_efficiency(power_factor)

    return kwh / power_efficiency * price
