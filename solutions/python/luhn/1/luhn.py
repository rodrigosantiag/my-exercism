class Luhn:
    def __init__(self, card_num):
        self.card_num = card_num.replace(" ", "")

    def valid(self):
        if not self.card_num.isdigit() or len(self.card_num) <= 1:
            return False

        check_number = [int(char) for char in self.card_num[::-1]]

        for idx in range(1, len(check_number), 2):
            replacing_number = check_number[idx] * 2

            if replacing_number > 9:
                replacing_number -= 9

            check_number[idx] = replacing_number

        return sum(check_number) % 10 == 0
