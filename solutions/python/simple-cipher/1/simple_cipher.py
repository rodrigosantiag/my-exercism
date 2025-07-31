import string


class Cipher:
    def __init__(self, key=None):
        default_key = "d"
        self.alphabet = list(string.ascii_lowercase)
        self.key = key if key is not None else default_key * len(self.alphabet)

    def encode(self, text: str) -> str:
        return self.do_operation(text, True)

    def decode(self, text: str) -> str:
        return self.do_operation(text, False)

    def do_operation(self, text: str, encoding: bool) -> str:
        result = ""
        text = text.lower()

        for idx, letter in enumerate(text):
            letter_index = self.alphabet.index(letter)
            key_index = self.alphabet.index(self.key[idx % len(self.key)])

            if encoding:
                replacement_operation = letter_index + key_index
            else:
                replacement_operation = letter_index - key_index

            replacement_index = replacement_operation % len(self.alphabet)
            result += self.alphabet[replacement_index]

        return result
