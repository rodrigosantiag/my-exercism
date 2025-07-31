OCR_TRANSLATOR = {
    " _ | ||_|   ": "0",
    "     |  |   ": "1",
    " _  _||_    ": "2",
    " _  _| _|   ": "3",
    "   |_|  |   ": "4",
    " _ |_  _|   ": "5",
    " _ |_ |_|   ": "6",
    " _   |  |   ": "7",
    " _ |_||_|   ": "8",
    " _ |_| _|   ": "9",
}

LINE_LENGTH = 4
SLICE_LENGTH = 3


def convert(input_grid):
    valid_input, message = validate_input(input_grid)

    if not valid_input:
        raise ValueError(message)

    numbers = []

    for row in range(0, len(input_grid), LINE_LENGTH):
        partial_result = ""

        for start in range(0, len(input_grid[row]), SLICE_LENGTH):
            end = start + SLICE_LENGTH
            current_num = ""

            for inner_row in range(row, row + LINE_LENGTH):
                current_row = input_grid[inner_row]
                current_num = current_num + current_row[start:end]

            partial_result = partial_result + OCR_TRANSLATOR.get(current_num, "?")

        numbers.append(partial_result)

    return ",".join(numbers)


def validate_input(input):
    if len(input) % LINE_LENGTH > 0:
        return False, "Number of input lines is not a multiple of four"

    if any(len(row) % SLICE_LENGTH > 0 for row in input):
        return False, "Number of input columns is not a multiple of three"

    return True, None
