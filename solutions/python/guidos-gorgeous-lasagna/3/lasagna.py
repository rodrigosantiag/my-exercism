"""
Constraints which define expected bake time and preparation time per layer
"""
EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2


def bake_time_remaining(elapsed_bake_time: int) -> int:
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int baking time already elapsed.
    :return: int remaining bake time derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """

    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(number_of_layers: int) -> int:
    """Calculate preparation time before bake

    :param number_of_layers: int number of lasagna layers prepared
    :return: int time spent preparing lasagna layers

    Function that takes number of layers prepared as an argment and return the
    time in minutes spent to prepare all layers based on 'PREPARATION_TIME'
    """

    return number_of_layers * PREPARATION_TIME


def elapsed_time_in_minutes(number_of_layers: int, elapsed_bake_time: int) -> int:
    """Return elapsed cooking time.

    :param number_of_layers: int number of layers prepared
    :param elapsed_bake_time: int time in minutes of lasagna baking in the oven
    :return: int total time spent (prepare time + bake time)

    This function takes two numbers representing the number of layers & the time already spent
    baking and calculates the total elapsed minutes spent cooking the lasagna.
    """

    preparation_time = preparation_time_in_minutes(number_of_layers)

    return preparation_time + elapsed_bake_time
