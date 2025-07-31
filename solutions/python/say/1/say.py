def say(number):
    if not (0 <= number <= 999999999999):
        raise ValueError("input out of range")

    if number == 0:
        return "zero"

    # Define word lists for numbers
    ones = ["", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    teens = ["", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    tens = ["", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
    scales = ["", "thousand", "million", "billion", "trillion"]

    def chunk_to_words(chunk):
        words = []
        if chunk >= 100:
            words.append(ones[chunk // 100] + " hundred")
            chunk %= 100
        if 10 <= chunk <= 19:
            words.append(teens[chunk - 10])
        else:
            if chunk >= 20 and chunk % 10 > 0:
                words.append(tens[chunk // 10]+"-"+ones[chunk % 10])
                return " ".join(words)

            if chunk >= 20:
                words.append(tens[chunk // 10])
            if chunk % 10 > 0:
                words.append(ones[chunk % 10])
        return " ".join(words)

    chunks = []
    for i in range(4):
        chunk = number % 1000
        if chunk > 0:
            chunks.append(chunk_to_words(chunk) + " " + scales[i])
        number //= 1000

    # Reverse the chunks and join them
    words = " ".join(chunks[::-1])

    return words.strip()
