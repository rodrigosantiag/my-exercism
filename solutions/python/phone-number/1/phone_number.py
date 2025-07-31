import re


def _validate_number(number: str) -> str:
    number = re.sub(r"^\+|\(|\)|-|\.|\s", "", number)

    if len(number) < 10:
        raise ValueError("must not be fewer than 10 digits")

    if len(number) > 11:
        raise ValueError("must not be greater than 11 digits")

    if len(number) == 11 and not number.startswith("1"):
        raise ValueError("11 digits must start with 1")

    if (len(number) == 11 and number[4] == "0") or (len(number) == 10 and number[3] == "0"):
        raise ValueError("exchange code cannot start with zero")

    if (len(number) == 11 and number[4] == "1") or (len(number) == 10 and number[3] == "1"):
        raise ValueError("exchange code cannot start with one")

    if (len(number) == 11 and number[1] == "0") or (len(number) == 10 and number.startswith("0")):
        raise ValueError("area code cannot start with zero")

    if (len(number) == 11 and number[1] == "1") or (len(number) == 10 and number.startswith("1")):
        raise ValueError("area code cannot start with one")

    if not number.isdigit():
        if re.search(r"[a-zA-Z]", number):
            raise ValueError("letters not permitted")
        else:
            raise ValueError("punctuations not permitted")

    return number


class PhoneNumber:
    def __init__(self, number):
        number = _validate_number(number)

        if len(number) == 11:
            number = number[1:]
            self.area_code = number[1:4]
        else:
            self.area_code = number[:3]

        self.number = number

    def pretty(self) -> str:
        if len(self.number) == 11:
            area_code = self.number[1:4]
            exchange_code = self.number[4:7]
            subscriber_number = self.number[7:]
        else:
            area_code = self.number[:3]
            exchange_code = self.number[3:6]
            subscriber_number = self.number[6:]

        return f"({area_code})-{exchange_code}-{subscriber_number}"
